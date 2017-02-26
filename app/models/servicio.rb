class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista

  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/
end
