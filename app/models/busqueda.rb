class Busqueda < ApplicationRecord
  belongs_to :tipo_busqueda
  belongs_to :especialidad
  belongs_to :especialista
  belongs_to :tipo_servicio

  def tipo
    return self.tipo_busqueda
  end

  def self.titulo
		return "Búsqueda"
	end
end
