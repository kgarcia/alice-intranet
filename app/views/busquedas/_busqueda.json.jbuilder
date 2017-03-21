json.extract! busqueda, :id, :descripcion, :estatus, :tipo_busqueda_id, :especialidad_id, :especialista_id, :tipo_servicio_id, :created_at, :updated_at
json.url busqueda_url(busqueda, format: :json)