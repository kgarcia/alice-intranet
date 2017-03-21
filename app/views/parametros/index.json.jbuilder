json.array!(@parametros) do |parametro|
  json.extract! parametro, :id, :descripcion, :estatus
  json.url parametro_url(parametro, format: :json)
end
