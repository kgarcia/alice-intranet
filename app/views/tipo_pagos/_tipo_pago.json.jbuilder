json.extract! tipo_pago, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_pago_url(tipo_pago, format: :json)