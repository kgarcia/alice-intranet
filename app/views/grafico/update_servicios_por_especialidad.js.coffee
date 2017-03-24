$("#servicio").empty()
  .append("<option value>Seleccione</option>")
  .append("<%= escape_javascript(render(:partial => @servicios)) %>")
