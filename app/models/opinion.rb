class Opinion < ApplicationRecord
  belongs_to :tipo_opinion
  belongs_to :motivo

  def self.titulo
	  return "Opinión"
  end
end
