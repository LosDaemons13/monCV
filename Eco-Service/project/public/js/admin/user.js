$(document).ready(function() {
    initialize_datatable();
} );

function initialize_datatable(){
    console.log('initialize_datatable start');
    $('#example').DataTable({
        ajax: 'get-all-users',
        "columns": [
            { "data": "id" },
            { "data": "firstname" },
            { "data": "lastname" },
            { "data": "birthdate" },
            { "data": "email" },
            { "data": "phone" },
            { "data": "roles" },
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