const urlParams = new URLSearchParams(window.location.search);
const datePressed = urlParams.get('date');

if ($(window).width() < 600) {
    $('.left_button-back').text('').append('<i class="fa fa-angle-double-left" style="color: white; font-size: 1em"></i>');
}

if(!is_date_available_from_8) {
    $('#reservation_timeFrom_0').attr({'disabled': true, 'checked': false});
    // $('#reservation_timeFrom_0').attr('checked', '');
    $('#reservation_timeFrom_1').attr('checked', true);
}

if ($('.wrong_sector_title')[0].innerHTML && $('.wrong_sector_title')[0].innerHTML === 'Blogai pasirinktas sektorius') {
    $('form').remove();
    $('.reservation_form .box-success').append('<div>' +
                                                    '<a class="submit_button mt-2 mb-2" href="./" style="color:white">Grižti į kalendorių</a>' +
                                               '</div>')
}









