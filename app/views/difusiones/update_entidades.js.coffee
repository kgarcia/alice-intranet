$("#difusion_entidad_id").empty()
  .append("<%= escape_javascript(render(:partial => @entidades)) %>")