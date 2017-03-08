class TipoTurno < ApplicationRecord
	has_many :turnos

	  def self.titulo
	  return "Tipo Turno"
  end
end
