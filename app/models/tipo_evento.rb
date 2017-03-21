class TipoEvento < ApplicationRecord
	has_many :eventos, dependent: :destroy


  extend FriendlyId
  friendly_id :descripcion, use: :slugged


  def self.titulo
	  return "Tipo de Evento"
  end


  def as_json(options={})
    super(include: {eventos: { :methods => :foto_url ,include: [:tipo_evento, :ubicacion]}})
  end
end
