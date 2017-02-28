class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista

  has_one :horario
  has_many :servicio_evento
  has_many :eventos, through: :servicio_evento


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  def self.titulo
	  return "Servicios"
  end
end
