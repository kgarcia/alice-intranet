class Turno < ApplicationRecord
  belongs_to :dia, foreign_key:"dia_id"
  belongs_to :horario, foreign_key:"horario_id"

def tipodia
  	return self.dia
  end

  def cantidad_horas
	(((self.hora_fin).to_time-(self.hora_inicio).to_time )/3600).round
  end
end
