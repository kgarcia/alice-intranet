json.extract! ubicacion, :id, :descripcion, :estatus, :sector_id, :ciudad_id, :tipo_ubicacion_id, :created_at, :updated_at
json.url ubicacion_url(ubicacion, format: :json)