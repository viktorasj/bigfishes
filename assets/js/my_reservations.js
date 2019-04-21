const user_reservations = JSON.parse(user_data.replace(/&quot;/g,'"'));
const table_head_names =
    [
        'Sektorius',
        'Nuo',
        'Iki',
        'Žuklės val.',
        'Kaina',
        'Apm. būsena',
        'Sukurta',
        ''
    ]
;

let cross = "<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"1.1\" id=\"Layer_1\" x=\"0px\" y=\"0px\" viewBox=\"0 0 512 512\" style=\"enable-background:new 0 0 512 512;\" xml:space=\"preserve\">\n" +
    "<circle style=\"fill:#E21B1B;\" cx=\"256\" cy=\"256\" r=\"256\"/>\n" +
    "<path style=\"fill:#C40606;\" d=\"M510.28,285.304L367.912,142.936L150.248,368.608l140.928,140.928  C406.352,493.696,497.056,401.288,510.28,285.304z\"/>\n" +
    "<g>\n" +
    "\t<path style=\"fill:#FFFFFF;\" d=\"M354.376,371.536c-5.12,0-10.232-1.952-14.144-5.856L146.408,171.848   c-7.816-7.816-7.816-20.472,0-28.28s20.472-7.816,28.28,0L368.52,337.4c7.816,7.816,7.816,20.472,0,28.28   C364.608,369.584,359.496,371.536,354.376,371.536z\"/>\n" +
    "\t<path style=\"fill:#FFFFFF;\" d=\"M160.544,371.536c-5.12,0-10.232-1.952-14.144-5.856c-7.816-7.816-7.816-20.472,0-28.28   l193.832-193.832c7.816-7.816,20.472-7.816,28.28,0s7.816,20.472,0,28.28L174.688,365.68   C170.784,369.584,165.664,371.536,160.544,371.536z\"/>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "<g>\n" +
    "</g>\n" +
    "</svg>"

if (user_reservations.length){
    for (let i = 0; i < table_head_names.length; i++){
        $('.ur_table_head_row').append('<th class="align-middle my_reservations_th-'+i+'">'+table_head_names[i]+'</th>');
    }


    for (let i = 0; i < user_reservations.length; i++){
        $('.tbody').append('<tr>' +
            '<td class="text-center">'+user_reservations[i].sectorName+'</td>'+
            '<td class="text-center">'+user_reservations[i].dateFrom+' '+user_reservations[i].timeFrom+':00'+'</td>'+
            '<td class="text-center">'+user_reservations[i].dateTo+' '+user_reservations[i].timeTo+':00'+'</td>'+
            '<td class="text-center">'+user_reservations[i].hours+'</td>'+
            '<td class="text-center">'+user_reservations[i].amount+'&euro;</td>'+
            '<td class="text-center">'+user_reservations[i].payment_status+'</td>'+
            '<td class="text-center">'+user_reservations[i].createdAt+'</td>'+
            '<td class="text-center" data-reservation-id='+user_reservations[i].id+'><a href="/delete_reservation/'+user_reservations[i].id+'">Ištrinti rezervaciją</a></td>'+
            '</tr>')
    }
}
else {
    $('.box-body').remove();
    $('.done_reservations').text('Jūs neturite rezervacijų')
}

