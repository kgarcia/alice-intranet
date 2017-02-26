json.extract! estado, :id, :descripcion, :estatus, :pais_id, :created_at, :updated_at
json.url estado_url(estado, format: :json)