json.extract! perfil, :id, :descripcion, :estatus, :created_at, :updated_at
json.url perfil_url(perfil, format: :json)
