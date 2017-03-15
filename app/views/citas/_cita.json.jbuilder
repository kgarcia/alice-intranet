json.extract! cita, :id, :turno_id, :persona_id, :usuario_id, :fecha, :tipo_pago_id,  :estatus, :created_at, :updated_at
json.url cita_url(cita, format: :json)