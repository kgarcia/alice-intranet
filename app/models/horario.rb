class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turno
  def tipo
  	return self.tipo_horario
  end

  def cantidad_pacientes_turno
  	return turno.cantidad_horas/horario.limite_horario
  end
end
