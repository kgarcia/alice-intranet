class Turno < ApplicationRecord
  belongs_to :dia, foreign_key:"dia_id"
  belongs_to :horario, foreign_key:"horario_id"
  belongs_to :tipo_turno, foreign_key:"tipo_turno_id"

def tipodia
  	return self.dia
  end

  def cantidad_horas
	(((self.hora_fin).to_time-(self.hora_inicio).to_time )/3600).round
  end
  def tipo_turno
  	return self.tipo_turno
  end
end
