class Evento < ApplicationRecord
  belongs_to :tipo_evento
  has_many :servicio_evento
  has_many :servicios, through: :servicio_evento


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  after_save :save_servicios

  attr_reader :servicioEvento

  	def servicioEvento=(value)
	  	@servicioEvento = value
	  end

  def tipo
    return self.tipo_evento
  end

  def self.titulo
    return "Evento"
  end

   private
    def save_servicios
     ServicioEvento.where(:evento_id => self.id).destroy_all
     if !@servicioEvento.nil?
	      @servicioEvento.each do |servicio_id|
		      ServicioEvento.create(servicio_id: servicio_id, evento_id: self.id )
        end
	   end
   end
end
