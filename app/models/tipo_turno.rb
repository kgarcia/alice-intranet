class TipoTurno < ApplicationRecord
	has_many :turnos, dependent: :destroy

	  def self.titulo
		  return "Tipo Turno"
	  end

	  def self.contarCitas
	    @citas = TipoTurno.joins(turnos: :citas).group("tipo_turnos.descripcion").count
	    return @citas
	  end
end
