json.array!(@sexos) do |sexo|
  json.extract! sexo, :id, :descripcion
  json.url sexo_url(sexo, format: :json)
end
