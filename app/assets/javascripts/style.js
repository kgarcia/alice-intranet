$(document).ready(function(){
    $('.table').footable({
        "paging": {
            "enabled": true,
            "size": 7,
            "countFormat": "{CP} de {TP}"
        },
        "filtering": {
            "enabled": true
        }
    });
});

$.extend(true, $.fn.dataTable.defaults, {
    "language": {"url": "/js/datatables/Spanish.json"}
});

  var rango_valido = function(e_inicio, e_fin) {
      
      var inicio = 0;
      var fin = 0;
      
      inicio = parseInt(e_inicio);
      fin = parseInt(e_fin);
      
      if(fin == 0){
        
        return false;
      }
      else{
          if(fin < inicio){
            
            return false;
          }
          else{
            
            return true;
          }
      }
  };

  var valor_negativo = function(e_inicio) {
      
      var inicio = 0;
      
      inicio = parseInt(e_inicio);
      
      if( inicio < 0){
          return false;
      }
      else{
          return true;
      }
  };


  jQuery.validator.addMethod("valor_negativo", function(value, element) {

      return valor_negativo(value);
  }, "Este campos no puede ser un valor negativo");

jQuery.validator.addMethod("solo_letras", function(value, element) {
      
	return this.optional(element) || /^[a-zA-ZáéíóúàèìòùÀÈÌÒÙÁÉÍÓÚñÑüÜ\s]+$/i.test(value);
    
}, "Este campo solo puede contener letras");

$(function () {

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
	
    $('.fecha-n-persona .input-group.date').datepicker({
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        format: "dd/mm/yyyy",
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

