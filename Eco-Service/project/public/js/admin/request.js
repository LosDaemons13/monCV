$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#request').DataTable({
        ajax: 'get-all-request',
        "columns": [
            { "data": "companyName" },
            { "data": "label" },
            { "data": "message" },
            { "data": "canceledAt" },
            { "data": "Rlabel" }
        ],
        "initComplete": function(settings, json) {
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        }
    });
}