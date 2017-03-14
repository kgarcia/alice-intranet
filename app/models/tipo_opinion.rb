class TipoOpinion < ApplicationRecord
has_many :opiniones
  def self.titulo
	  return "Tipo de Opinión"
  end

end
