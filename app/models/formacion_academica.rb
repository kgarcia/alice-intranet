class FormacionAcademica < ApplicationRecord
  belongs_to :nivel_formacion

  def tipo
  	return self.nivel_formacion
  end
  def self.titulo
	  return "Formacion Academica"
  end
end
