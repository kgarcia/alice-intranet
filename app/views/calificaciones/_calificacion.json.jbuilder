json.extract! calificacion, :id, :descripcion, :estatus, :tipo_calificacion_id, :created_at, :updated_at
json.url calificacion_url(calificacion, format: :json)