# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#tipo_entidad', (evt) ->
    $.ajax '/grafico/update_entidades',
      type: 'GET'
      dataType: 'script'
      data: {
        tipo_entidad: $("#tipo_entidad option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#id_evento', (evt) ->
    $.ajax '/grafico/update_eventos',
      type: 'GET'
      dataType: 'script'
      data: {
        evento_id: $("#id_evento option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'change', '#id_tipo_servicio', (evt) ->
    $.ajax '/grafico/update_servicios',
      type: 'GET'
      dataType: 'script'
      data: {
        servicio: $("#id_tipo_servicio option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
    $(document).on 'change', '#especialidad', (evt) ->
        $.ajax '/grafico/update_servicios_por_especialidad',
            type: 'GET'
            dataType: 'script'
            data: {
                especialidad_id: $("#especialidad option:selected").val()
            }
            error: (jqXHR, textStatus, errorThrown) ->                
                console.log("AJAX Error: #{textStatus}")
            success: (data, textStatus, jqXHR) ->
                console.log("Dynamic country select OK!")
