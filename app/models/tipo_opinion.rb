class TipoOpinion < ApplicationRecord
has_many :opiniones, dependent: :destroy
  def self.titulo
	  return "Tipo de Opinión"
  end

end
