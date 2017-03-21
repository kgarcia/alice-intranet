$(function() {

    var fecha_inicio = new Date();

    fecha_inicio = new Date((fecha_inicio.getFullYear()- 18), 11, 31);

    $('.fecha-n-persona .input-group.date').datepicker({
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "dd/mm/yyyy",
        endDate: fecha_inicio,
        language: "es"
    });
});