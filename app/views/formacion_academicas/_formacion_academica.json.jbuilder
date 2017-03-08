json.extract! formacion_academica, :id, :descripcion, :estatus, :nivel_formacion_id, :created_at, :updated_at
json.url formacion_academica_url(formacion_academica, format: :json)