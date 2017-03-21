json.extract! tipo_evaluacion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_evaluacion_url(tipo_evaluacion, format: :json)