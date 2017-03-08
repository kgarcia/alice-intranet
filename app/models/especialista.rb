class Especialista < ApplicationRecord
  belongs_to :especialidad
  belongs_to :universidad
  belongs_to :formacion_academica
  belongs_to :persona

  def nombre
  	return self.persona.nombre + " "+ self.persona.apellido
  end

  def self.titulo
	  return "Especialista"
  end
end
