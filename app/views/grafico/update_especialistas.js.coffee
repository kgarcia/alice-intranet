$("#servicio_especialista_id").empty()
  .append("<option value>Seleccione</option>")
  .append("<%= escape_javascript(render(:partial => @especialistas)) %>")
