class TipoNoticia < ApplicationRecord
	has_many :noticias
  def self.titulo
	  return "Tipo de Noticia"
  end

  def as_json(options={})
    super(include: :noticias)
  end

end
