json.extract! tipo_patologia, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_patologia_url(tipo_patologia, format: :json)