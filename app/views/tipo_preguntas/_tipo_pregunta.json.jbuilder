json.extract! tipo_pregunta, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_pregunta_url(tipo_pregunta, format: :json)