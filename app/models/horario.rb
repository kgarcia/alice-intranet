class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turno
  def tipo
  	return self.tipo_horario
  end
  def self.titulo
	  return "Tipos de horario"
  end
end
