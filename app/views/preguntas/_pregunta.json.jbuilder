json.extract! pregunta, :id, :titulo, :descripcion, :respuesta, :tipo_pregunta_id, :estatus, :created_at, :updated_at
json.url pregunta_url(pregunta, format: :json)