$(document).ready(function(){
     //   # sorting DataTables;
    // Disable search and ordering by default
    $.extend( $.fn.dataTable.defaults, {
        searching: true,
        ordering:  true
    } );
    $('#pro_table').DataTable( {
        paging: true,
        // scrollY: 400,
        responsive: true,
        select: true,
        // keys: true,
        searching: true,
        ordering:  true,
        lengthChange: true,
        info: true,
        autoWidth: false
    } );
})