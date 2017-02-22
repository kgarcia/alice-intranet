json.extract! tipo_atencion, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_atencion_url(tipo_atencion, format: :json)