json.extract! noticia, :id, :titulo, :descripcion, :contenido,:tipo_noticia,  :estatus, :created_at, :updated_at
json.url noticia_url(noticia, format: :json)