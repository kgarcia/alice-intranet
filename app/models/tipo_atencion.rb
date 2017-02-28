class TipoAtencion < ApplicationRecord
	has_many :atenciones
	has_many :tipo_servicio
	
  def self.titulo
	  return "Tipos de Atencion"
  end 

end
