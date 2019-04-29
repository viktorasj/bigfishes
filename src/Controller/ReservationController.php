<?php

namespace App\Controller;

use App\Entity\Reservation;
use App\Form\ReservationType;
use App\Service\ReservationService;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response as ResponseAlias;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Translation\TranslatorInterface;

/**
 * @IsGranted("ROLE_USER")
 */
class ReservationController extends AbstractController
{
    const SECTOR_NUMBER = "Trečias Sektorius";

    /**
     * @Route("/reservation", name="new_reservation")
     * @IsGranted("ROLE_USER")
     * @throws
     */
    public function newAction(Request $request, ReservationService $reservationService)
    {
        if ($request->query->get('sector')) {
            $sector = $request->query->get('sector');
        } else {
            $this->addFlash('warning', 'Reservation Sector not selected');
            return $this->redirectToRoute('home');
        }

        $isSectorValid = $reservationService->isSectorValid($sector);
        if ($isSectorValid) {
            $sectorNumber = $reservationService->sectorKeyToName($sector);
        } else {
            $sectorNumber = $sector;
        }


        try {
            $dateFrom = new \DateTime($request->query->get('date', 'now'));
        } catch (\Exception $e) {
            $dateFrom = new \DateTime('now');
        }

        $reservation = new Reservation();
        $reservation->setDateFrom($dateFrom);

        $availableDateTo = $this->getDoctrine()
            ->getRepository(Reservation::class)
            ->findAvailableDateTo($sectorNumber, $dateFrom);


        $isDateAvailableFrom7 = $this->getDoctrine()
            ->getRepository(Reservation::class)
            ->isAvailableDateFrom($sectorNumber, $dateFrom);

        $default_date_to = $dateFrom;

        $form = $this->createForm(
            ReservationType::class,
            $reservation,
            []
        );

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $dateFrom = $form->getData()->getDateFrom()->setTime($form->get('timeFrom')->getData(), '00');
            $dateTo = $form->getData()->getDateTo()->setTime($form->get('timeTo')->getData(), '00');
            $default_date_to = $dateTo;

            $isAvailableDateFrom = $this->getDoctrine()
                ->getRepository(Reservation::class)
                ->isAvailableDateFrom($sectorNumber, $dateFrom);

            if ($isAvailableDateFrom) {
                $isAvailableDateTo = $this->getDoctrine()
                    ->getRepository(Reservation::class)
                    ->isAvailableDateTo($sectorNumber, $dateTo, $dateFrom);
                if ($isAvailableDateTo) {
                    if ($isSectorValid) {
                        $reservation->setSectorName($sectorNumber);
                        if (!$reservationService->isTimeFrom07($dateFrom) &&
                            !$reservationService->isTimeFrom07($dateTo)) {
                            $totalHours = $reservationService->hoursTotal($dateFrom, $dateTo);
                            $fishersNumber = $reservation->getFishersNumber();
                            $fishingPrice = $reservationService->fishingPriceCalculation($fishersNumber, $totalHours);
                            if ($sectorNumber === self::SECTOR_NUMBER) {
                                $reservation->setHouse(true);
                                $housePrice = $reservationService->housePriceCalculation($totalHours);
                                $reservation->setHousePrice($housePrice);
                                $totalPrice = $reservationService->totalPriceCalculation($fishingPrice, $housePrice);
                            } else {
                                $totalPrice = $fishingPrice;
                            }
                            $reservation->setDateFrom($dateFrom);
                            $reservation->setDateTo($dateTo);
                            $reservation->setHours($totalHours);
                            $reservation->setFishingPrice($fishingPrice);
                            $reservation->setAmount($totalPrice);

                            $request->getSession()->set('reservationObject', $reservation);

                            return $this->redirectToRoute('reservation_confirmation');

                        } else {
                            $this->addFlash(
                                'warning',
                                'The Reservation time in weekend available from 19:00 to 19:00'
                            );
                        }
                    } else {
                        $this->addFlash(
                            'warning',
                            'Sector does not exist'
                        );
                    }
                } else {
                    $this->addFlash('warning', 'Reservation End Date is not available');
                }
            } else {
                $this->addFlash('warning', 'Reservation Start Date is not available');
            }
        }
        return $this->render('reservation/new.html.twig', [
            'form' => $form->createView(),
            'data' => $form->getData(),
            'availableDateTo' => $availableDateTo,
            'isDateAvailableFrom7' => $isDateAvailableFrom7,
            'sector_name' => $reservationService->sectorKeyToName($sector),
            'default_date_to' => $default_date_to
        ]);
    }

    /**
     * @Route("/reservation_confirmation", name="reservation_confirmation")
     * @IsGranted("ROLE_USER")
     *
     */
    public function reservationConfirmationAction(Request $request)
    {
        $formData = $request->getSession()->get('reservationObject');
        $fishingPrice = $formData->getFishingPrice();
        $housePrice = $formData->getHousePrice();

        return $this->render('reservation/confirm.html.twig', [
            'data' => $formData,
            'fishingPrice' => $fishingPrice,
            'housePrice' => $housePrice,
        ]);
    }

    /**
     * @Route("/reservation/flush", name="flush_reservation")
     * @IsGranted("ROLE_USER")
     */
    public function paymentAction(\Swift_Mailer $mailer, TranslatorInterface $translator, Request $request)
    {
        $reservation = $request->getSession()->get('reservationObject');
        if ($this->isGranted('ROLE_ABONENT') || $this->isGranted('ROLE_ADMIN')) {
            $reservation->setPaymentStatus(true);
        }
        $reservation->setStatus(true);
        $reservation->setUser($this->getUser());
        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($reservation);
        $entityManager->flush();


        $message = (new \Swift_Message($translator->trans('Reservation Confirmation')))
            ->setFrom('bigfishes2019@gmail.com')
            ->setTo($this->getUser()->getEmail())
            ->setBody(
                $this->renderView(
                    'emails/reservation.html.twig',
                    array('name' => $this->getUser()->getName(),
                        'reservation' => $reservation
                    )
                ),
                'text/html'
            );
        $mailer->send($message);
        $this->addFlash('success', 'Reservation made successfully');
        if ($this->isGranted('ROLE_ABONENT') || $this->isGranted('ROLE_ADMIN')) {
            return $this->redirectToRoute('home');
        }

        return $this->redirectToRoute('reservation_info');
    }

    /**
     * @Route("/reservation_info", name="reservation_info")
     * @IsGranted("ROLE_USER")
     */
    public function reservationInfoAction(Request $request)
    {
        $reservation = $request->getSession()->get('reservationObject');
        return $this->render('reservation/payment.html.twig', [
            'reservation' => $reservation,
            'userEmail' => $this->getUser()->getEmail()
        ]);
    }

    /**
     * @Route("/myReservations", name="my_reservations")
     * @IsGranted("ROLE_USER")
     *
     * @param ReservationService $reservationService
     *
     * @return ResponseAlias
     */
    public function myReservations(ReservationService $reservationService)
    {
        $userReservations = $this->getDoctrine()
            ->getRepository(Reservation::class)
            ->findByUser($this->getUser()->getId());

        $userData = $reservationService->createUserReservationDataArray($userReservations);

        return $this->render('reservation/myReservations.html.twig', [
            'userData' => $userData,
            'username' => $this->getUser()->getName(),
            'email' => $this->getUser()->getEmail()
        ]);
    }

    /**
     * @Route("/delete_reservation/{id}", name="delete")
     * @IsGranted("ROLE_USER")
     */
    public function removeReservationAction(int $id)
    {
        $user = $this->getUser();
        $userId = $user->getId();
        $entityManager = $this->getDoctrine()->getManager();
        $reservation = $this->getDoctrine()
            ->getRepository(Reservation::class)
            ->findById($id);
        if($reservation->getUserId() === $userId){
            $entityManager->remove($reservation);
            $entityManager->flush();
        }
        return $this->redirectToRoute('my_reservations');
    }
}
