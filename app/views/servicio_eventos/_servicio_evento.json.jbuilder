json.extract! servicio_evento, :id, :descripcion, :estatus, :servicio_id, :evento_id, :created_at, :updated_at
json.url servicio_evento_url(servicio_evento, format: :json)