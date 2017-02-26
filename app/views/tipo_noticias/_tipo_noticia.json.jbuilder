json.extract! tipo_noticia, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_noticia_url(tipo_noticia, format: :json)