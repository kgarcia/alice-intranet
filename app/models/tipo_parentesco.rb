class TipoParentesco < ApplicationRecord
	has_many :parentescos
	def self.titulo
	  return "Tipo de Parentesco"
  end
end
