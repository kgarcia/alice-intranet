class TipoAtencion < ApplicationRecord
	has_many :atenciones, dependent: :destroy
	has_many :tipo_servicio, dependent: :destroy
	
  def self.titulo
	  return "Tipo de Atención"
  end 

end
