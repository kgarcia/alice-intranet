json.extract! horario, :id, :tipo_horario_id, :tiempo_cita, :servicio_id, :created_at, :updated_at
json.url horario_url(horario, format: :json)