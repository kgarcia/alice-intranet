json.extract! tipo_lesion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_lesion_url(tipo_lesion, format: :json)