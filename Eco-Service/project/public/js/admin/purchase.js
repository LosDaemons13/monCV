$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#purchase').DataTable({
        ajax: 'get-all-purchases',
        "columns": [
            { "data": "firstname" },
            { "data": "label" },
            { "data": "createdAt" },
            { "data": "canceledAt" },
            { "data": "actions" }
        ],
        "initComplete": function(settings, json) {
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        }
    });
}