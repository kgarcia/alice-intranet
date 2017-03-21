json.extract! tipo_calificacion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_calificacion_url(tipo_calificacion, format: :json)