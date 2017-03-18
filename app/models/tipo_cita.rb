class TipoCita < ApplicationRecord
has_many :citas
  def self.titulo
	  return "Tipo de Cita"
  end
end
