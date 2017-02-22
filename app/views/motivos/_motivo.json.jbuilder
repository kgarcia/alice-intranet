json.extract! motivo, :id, :descripcion, :estatus, :tipo_motivo_id, :created_at, :updated_at
json.url motivo_url(motivo, format: :json)