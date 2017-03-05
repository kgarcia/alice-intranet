class Turno < ApplicationRecord
  belongs_to :dia, foreign_key:"dia_id"
  belongs_to :horario, foreign_key:"horario_id"
  belongs_to :tipo_turno, foreign_key:"tipo_turno_id"
  has_many :cita
  
  def dia
  	return self.dia
  end

  def cantidad_horas
	(((self.hora_fin).to_time-(self.hora_inicio).to_time )/60).round
  end

  def tipo_turno
  	return self.tipo_turno
  end
  def self.titulo
	  return "Turnos"
  end

   def numero_pacientes_por_turno
    
    @horario = Horario.find(self.horario_id)
    if @horario.tiempo_cita !=0
    return self.cantidad_horas/@horario.tiempo_cita
    end
  end

end
