$(document).ready(function() {
    $("#quantity").on('change', function() {
        productId = $(this).next().val()
        $("#add_to_cart").attr('href', '/individual/cart/add/' + productId + '/' + $(this).val())
    })
});

function select_pic(src) {
    console.log('select_pic');
    console.log('src : ', src);
    $('#main_pic').attr('src', src);
}