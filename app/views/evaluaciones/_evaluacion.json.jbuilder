json.extract! evaluacion, :id, :descripcion, :estatus, :tipo_evaluacion_id, :created_at, :updated_at
json.url evaluacion_url(evaluacion, format: :json)