json.extract! notificacion, :id, :descripcion, :estatus, :tipo_notificacion_id, :created_at, :updated_at
json.url notificacion_url(notificacion, format: :json)