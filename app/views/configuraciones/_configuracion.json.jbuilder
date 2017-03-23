json.extract! configuracion, :id, :envia_email, :envia_notificaciones, :created_at, :updated_at
json.url configuracion_url(configuracion, format: :json)
