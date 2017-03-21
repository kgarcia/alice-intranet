json.extract! opinion, :id, :correo, :nombre, :descripcion, :tipo_opinion, :estatus, :created_at, :updated_at
json.url opinion_url(opinion, format: :json)