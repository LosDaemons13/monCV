$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#product').DataTable({
        ajax: 'get-all-products',
        "columns": [
            { "data": "id" },
            { "data": "label" },
            { "data": "description" },
            { "data": "price" },
            { "data": "stock" },
            { "data": "createdAt" },
            { "data": "actions" }
        ],
        "initComplete": function(settings, json) {
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        }
    });
}