$("#tipo_servicio_id").empty()
  .append("<option value>Seleccione</option>")
  .append("<%= escape_javascript(render(:partial => @tipo_servicios)) %>")
