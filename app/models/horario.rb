class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turnos

  belongs_to :servicio

  def tipo
  	return self.tipo_horario
  end

  def self.titulo
	  return "Tipo de Horario"
  end
  
  def cantidad_pacientes_turno
  	return turno.cantidad_horas/horario.tiempo_cita
  end
end
