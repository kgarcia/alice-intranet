# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $(document).on 'change', '#horario_tipo_horario_id', (evt) ->
    if $('#horario_tipo_horario_id').val() == '1'
    	$('#horario_tiempo_cita').parent().hide()
    	$('#horario_tiempo_cita').val('0')		
    else
    	$('#horario_tiempo_cita').parent().show()
    	