class TipoCriterio < ApplicationRecord
	has_many :tipo_criterios
	def self.titulo
	  return "Tipo de Criterio"
  end
end
