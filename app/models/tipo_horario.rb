class TipoHorario < ApplicationRecord
	has_many :horarios
  def self.titulo
	  return "Tipos de Horario"
  end
end
