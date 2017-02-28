class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turno
  belongs_to :servicio,  foreign_key: "servicio_id"
  def tipo
  	return self.tipo_horario
  end

  def cantidad_pacientes_turno
  	return turno.cantidad_horas/horario.tiempo_cita
  end
end
