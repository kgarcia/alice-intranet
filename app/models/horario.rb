class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turno
  def tipo
  	return self.tipo_horario
  end
<<<<<<< HEAD
  def self.titulo
	  return "Tipos de horario"
=======

  def cantidad_pacientes_turno
  	return turno.cantidad_horas/horario.tiempo_cita
>>>>>>> ae7de5a72b04711f631ce4bc446b80bd5fc41189
  end
end
