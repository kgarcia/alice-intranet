class Noticia < ApplicationRecord
  belongs_to :tipo_noticia

  def self.titulo
	  return "Noticias"
  end

  
end
