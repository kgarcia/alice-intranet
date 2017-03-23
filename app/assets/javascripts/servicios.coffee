# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $('#servicio_tipo_servicio_id').change ->
        $.ajax '/tipo_servicios.json',
            type: 'GET'
            dataType: 'html'
            error: (jqXHR, textStatus, errorThrown) ->
                $('body').append "AJAX Error: #{textStatus}"
            success: (data, textStatus, jqXHR) ->
                $('body').append "Successful AJAX call: #{data}"
