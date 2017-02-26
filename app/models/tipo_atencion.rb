class TipoAtencion < ApplicationRecord
	has_many :atenciones 
	has_many :tipo_servicio
end
