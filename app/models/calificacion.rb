class Calificacion < ApplicationRecord
  belongs_to :tipo_calificacion

  def tipo
  	return self.tipo_calificacion
  end
end
