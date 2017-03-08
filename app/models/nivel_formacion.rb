class NivelFormacion < ApplicationRecord
	has_many :formacion_academicas
  def self.titulo
	  return "Nivel de Formacion"
  end
end
