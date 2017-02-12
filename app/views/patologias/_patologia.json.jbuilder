json.extract! patologia, :id, :descripcion, :estatus, :TipoPatologia_id, :created_at, :updated_at
json.url patologia_url(patologia, format: :json)