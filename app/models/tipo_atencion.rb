class TipoAtencion < ApplicationRecord
	has_many :atenciones
  def self.titulo
	  return "Tipos de Atencion"
  end 
end
