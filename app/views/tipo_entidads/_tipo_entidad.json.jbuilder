json.extract! tipo_entidad, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_entidad_url(tipo_entidad, format: :json)