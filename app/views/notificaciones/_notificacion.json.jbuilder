json.extract! notificacion, :id, :descripcion, :mensaje, :url, :usuario_id, :estatus, :tipo_notificacion_id, :created_at, :updated_at
json.url notificacion_url(notificacion, format: :json)