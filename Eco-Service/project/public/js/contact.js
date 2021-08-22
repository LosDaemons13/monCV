$('#form_contact').on("submit", function(e) {
    console.log('form_contact submit');
    e.preventDefault();
    let form_el = $(this);
    $.ajax({
        type: 'POST',
        url: form_el.attr('action'),
        data: form_el.serialize(),
        dataType: "json"
    }).done(function(response) {
        console.log('response : ', response);
        let html = '<h3>'+response+'</h3>';
        $('#mail_form_area').html(html);
    });
});