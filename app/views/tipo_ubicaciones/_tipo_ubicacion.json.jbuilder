json.extract! tipo_ubicacion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_ubicacion_url(tipo_ubicacion, format: :json)