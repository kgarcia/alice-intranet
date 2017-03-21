class TipoNoticia < ApplicationRecord
	has_many :noticias

	
  extend FriendlyId
  friendly_id :descripcion, use: :slugged

  def self.titulo
	  return "Tipo de Noticia"
  end

  def as_json(options={})
    super(include: {noticias: {include: :tipo_noticia}})
  end

end
