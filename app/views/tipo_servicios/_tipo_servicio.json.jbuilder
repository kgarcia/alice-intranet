json.extract! tipo_servicio, :id, :descripcion, :texto, :foto, :estatus, :created_at, :updated_at, :slug
json.url tipo_servicio_url(tipo_servicio, format: :json)