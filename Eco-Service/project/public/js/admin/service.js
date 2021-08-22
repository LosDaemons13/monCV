$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#service').DataTable({
        ajax: 'get-all-service',
        "columns": [
            { "data": "label" },
            { "data": "description" },
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