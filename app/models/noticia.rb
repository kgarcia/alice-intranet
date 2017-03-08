class Noticia < ApplicationRecord
  belongs_to :tipo_noticia

  def self.titulo
	  return "Noticia"
  end
end
