class TipoHorario < ApplicationRecord
	has_many :horarios
  def self.titulo
	  return "Tipo de Horario"
  end
end
