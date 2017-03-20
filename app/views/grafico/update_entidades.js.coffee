$("#entidad").empty()
  .append("<option value>Ver todas</option>")
  .append("<%= escape_javascript(render(:partial => @entidades)) %>")