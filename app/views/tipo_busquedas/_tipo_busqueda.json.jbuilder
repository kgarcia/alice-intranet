json.extract! tipo_busqueda, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_busqueda_url(tipo_busqueda, format: :json)