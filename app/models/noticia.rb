class Noticia < ApplicationRecord
  belongs_to :tipo_noticia

  extend FriendlyId
  friendly_id :titulo, use: :slugged

  def self.titulo
	  return "Noticia"
  end

  def tipo
    return self.tipo_noticia
  end


  def as_json(options={})
    super(include:  :tipo_noticia)
    end 

  
end
