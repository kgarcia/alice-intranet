class Difusion < ApplicationRecord
  belongs_to :tipo_entidad 
  belongs_to :tipo_difusion

  has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/
end
