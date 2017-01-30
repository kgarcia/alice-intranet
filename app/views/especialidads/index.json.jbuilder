json.array!(@especialidads) do |especialidad|
  json.extract! especialidad, :id, :codigo, :nombre, :estatus
  json.url especialidad_url(especialidad, format: :json)
end
