class Noticia < ApplicationRecord
  belongs_to :tipo_noticia

  extend FriendlyId
  friendly_id :titulo, use: :slugged

  def self.titulo
	  return "Noticia"
  end

  
  def foto_url
        foto.url(:medium)
    end

  def as_json(options={})
    super(include:  :tipo_noticia)
    end 

  
end
