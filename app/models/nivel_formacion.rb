class NivelFormacion < ApplicationRecord
	has_many :formacion_academicas, dependent: :destroy
  def self.titulo
	  return "Nivel de Formación"
  end
end
