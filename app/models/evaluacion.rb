class Evaluacion < ApplicationRecord
  belongs_to :tipo_evaluacion
  belongs_to :cita
  has_many :calificaciones
  accepts_nested_attributes_for :calificaciones

  def tipo
  	return self.tipo_evaluacion
  end  
  def self.titulo
	return "Evaluaciones"
  end
end
