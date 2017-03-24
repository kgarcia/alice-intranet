<% if @tieneEspecialista == true %>
$("#servicio_especialista_id").parent().show()
<% else %>
$("#servicio_especialista_id").parent().hide()
<% end %>
$("#servicio_especialista_id").empty()
  .append("<option value>Seleccione</option>")
  .append("<%= escape_javascript(render(:partial => @especialistas	)) %>")
