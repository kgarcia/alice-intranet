json.extract! notificacion, :id, :descripcion, :estatus, :enlace, :tipo_notificacion_id, :mensaje, :entidad_id, :created_at, :updated_at
json.url notificacion_url(notificacion, format: :json)