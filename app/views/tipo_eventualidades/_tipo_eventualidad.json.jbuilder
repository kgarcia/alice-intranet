json.extract! tipo_eventualidad, :id, :descripcion, :estatus, :created_at, :updated_at
json.url tipo_eventualidad_url(tipo_eventualidad, format: :json)