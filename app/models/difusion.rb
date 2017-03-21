class Difusion < ApplicationRecord
  belongs_to :tipo_entidad 
  belongs_to :tipo_difusion
  has_many :difusion_medio_difusion, dependent: :destroy
  has_many :medio_difusiones, through: :difusion_medio_difusion, dependent: :destroy

  has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\z/

  mount_uploader :avatar, AvatarUploader
  after_save :save_medios

  attr_reader :difusionesMedioDifusion

  def difusionesMedioDifusion=(value)
	  @difusionesMedioDifusion = value
  end

  def entidad
    if self.tipo_entidad_id == 1
      return Servicio.find(self.entidad_id)
    else
      return Evento.find(self.entidad_id)
    end
  end

  private
   def save_medios
    DifusionMedioDifusion.where(:difusion_id => self.id).destroy_all
    if !@difusionesMedioDifusion.nil?
        @difusionesMedioDifusion.each do |medio_id|
          DifusionMedioDifusion.create(medio_difusion_id: medio_id, difusion_id: self.id )
        end
     end
   end
end
