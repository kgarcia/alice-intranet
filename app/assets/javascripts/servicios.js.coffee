# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#servicio_tipo_servicio_id', (evt) ->
    $.ajax '/servicios/update_especialistas',
      type: 'GET'
      dataType: 'script'
      data: {
        tipo_servicio_id: $("#servicio_tipo_servicio_id option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")