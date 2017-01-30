json.array!(@especialista) do |especialistum|
  json.extract! especialistum, :id, :cedula, :nombre, :apellido, :especialidad_id, :fecha_ingreso, :sexo_id, :curriculum, :edad
  json.url especialistum_url(especialistum, format: :json)
end
