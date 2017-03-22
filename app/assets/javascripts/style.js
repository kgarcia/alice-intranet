
jQuery.validator.addMethod("solo_letras", function(value, element) {
      
	return this.optional(element) || /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ\s]+$/i.test(value);
    
}, "Este campo solo puede contener letras");

$.extend(true, $.fn.dataTable.defaults, {
	"language": {"url": "/js/datatables/Spanish.json"}
});

$(function () {
	$('.datetimepicker').datetimepicker();
	
	toastr.options = {
	  "closeButton": true,
	  "debug": false,
	  "newestOnTop": true,
	  "progressBar": true,
	  "positionClass": "toast-top-right",
	  "preventDuplicates": true,
	  "showDuration": "300",
	  "hideDuration": "1000",
	  "timeOut": "5000",
	  "extendedTimeOut": "1000",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	}
	
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
$(function() {

});

/*=============================================================================
            Funcion para Igualar el Tamanio de 2 o mas Elementos
=============================================================================*/

function alturasIguales(elemento){
    var altura_elemento_base = 0;

    jQuery(elemento).each(function() {
            jQuery(this).height('auto');
    });

    jQuery(elemento).each(function() {
        if(altura_elemento_base < jQuery(this).height()){
            altura_elemento_base = jQuery(this).height();
        }
    });

    jQuery(elemento).each(function() {
        jQuery(this).height(altura_elemento_base);
    });
}