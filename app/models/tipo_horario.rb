class TipoHorario < ApplicationRecord
	has_many :horarios, dependent: :destroy
  def self.titulo
	  return "Tipo de Horario"
  end
end
