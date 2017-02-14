json.extract! ubicacion, :id, :descripcion, :estatus, :ciudad_id, :tipo_ubicacion_id, :created_at, :updated_at
json.url ubicacion_url(ubicacion, format: :json)