json.extract! tipo_notificacion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_notificacion_url(tipo_notificacion, format: :json)