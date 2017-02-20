class TipoServicio < ApplicationRecord
	belongs_to :tipo_atencion
	has_many :adiccion_tipo_servicios
  	has_many :adiccions, :through => :adiccion_tipo_servicios
  	has_many :cirugia_tipo_servicios
  	has_many :cirugias, through: :cirugia_tipo_servicios

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  	after_create :save_adicciones
  	attr_reader :adicciones

  	def adicciones=(value)
	  	@adicciones = value
	  end

   private
   def save_adicciones
	@adicciones.each do |adiccion_id|
		AdiccionTipoServicio.create(adiccion_id: adiccion_id, tipo_servicio_id: self.id )
	end
   end
end
