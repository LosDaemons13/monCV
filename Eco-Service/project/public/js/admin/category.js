$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#category').DataTable({
        ajax: 'get-all-categorys',
        "columns": [
            { "data": "label" },
            { "data": "description" },
            { "data": "icon" },
            { "data": "actions" }
        ],
        "initComplete": function(settings, json) {
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            })
        }
    });
}