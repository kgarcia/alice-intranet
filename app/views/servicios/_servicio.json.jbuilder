json.extract! servicio, :id, :descripcion,  :ubicacion_id, :tipo_servicio, :especialista_id, :estatus, :foto, :precio, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)