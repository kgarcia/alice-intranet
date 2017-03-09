json.extract! evento, :id, :descripcion, :estatus, :tipo_evento_id, :created_at, :updated_at, :foto_url
json.url evento_url(evento, format: :json)