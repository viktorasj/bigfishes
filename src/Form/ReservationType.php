<?php

namespace App\Form;

use App\Entity\Reservation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\DateType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Security\Core\Security;

class ReservationType extends AbstractType
{
    private $security;

    /**
     * ReservationType constructor.
     * @param $security
     */
    public function __construct(Security $security)
    {
        $this->security = $security;
    }

    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', TextType::class, array(
                'label' => 'Reservation name',
                'attr' => array(
                    'placeholder' => 'Enter Reservation Name'
                ),
                'data' => $this->security->getUser()->getName()
            ))
            ->add('dateFrom', DateType::class, [
                'required' => true,
                'widget' => 'single_text',
                'attr' => [
                    'class' => 'js-datepicker',

                ],
                'html5' => false
            ])
            ->add('timeFrom', ChoiceType::class, array(
                'choices' => array('07:00' => '07', '19:00' => '19'),
                'expanded' => true,
                'data' => '08',
            ))
            ->add('dateTo', DateType::class, [
                'required' => true,
                'widget' => 'single_text',
                'attr' => [
                    'class' => 'js-datepicker',

                ],
                'html5' => false
            ])
            ->add('timeTo', ChoiceType::class, array(
                'choices' => array('07:00' => '07', '19:00' => '19'),
                'expanded' => true,
                'data' => '20',
            ))
            ->add('fishersNumber', ChoiceType::class, array(
                'choices' => array(1 => 1, 2 => 2,),
                'expanded' => true,
                'data' => 1,
                'label_attr' => array(
                    'class' => 'radio-inline'
                )
            ))
            ->add('user', HiddenType::class);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Reservation::class,
        ]);
    }
}
