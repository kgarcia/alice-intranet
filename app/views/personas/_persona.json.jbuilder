json.extract! persona, :id, :cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento, :sexo_id, :edad, :created_at, :updated_at
json.url persona_url(persona, format: :json)