class TipoAtencion < ApplicationRecord
<<<<<<< HEAD
	has_many :atenciones
  def self.titulo
	  return "Tipos de Atencion"
  end 
=======
	has_many :atenciones 
	has_many :tipo_servicio
>>>>>>> ae7de5a72b04711f631ce4bc446b80bd5fc41189
end
