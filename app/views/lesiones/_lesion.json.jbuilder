json.extract! lesion, :id, :descripcion, :estatus, :TipoLesion_id, :created_at, :updated_at
json.url lesion_url(lesion, format: :json)