class TipoAtencion < ApplicationRecord
	has_many :atenciones
	has_many :tipo_servicio
	
  def self.titulo
	  return "Tipo de Atención"
  end 

end
