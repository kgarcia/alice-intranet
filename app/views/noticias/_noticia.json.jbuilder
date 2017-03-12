json.extract! noticia, :id, :titulo, :descripcion, :tipo_noticia, :estatus, :created_at, :updated_at
json.url noticia_url(noticia, format: :json)