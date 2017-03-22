json.extract! categoria, :id, :descripcion, :slug, :estatus, :tipo_servicios, :foto, :created_at, :updated_at
json.url categoria_url(categoria, format: :json)