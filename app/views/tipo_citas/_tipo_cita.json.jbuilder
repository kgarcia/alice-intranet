json.extract! tipo_cita, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_cita_url(tipo_cita, format: :json)