json.extract! pregunta, :id, :descripcion, :respuesta, :tipo_pregunta, :estatus, :created_at, :updated_at
json.url pregunta_url(pregunta, format: :json)