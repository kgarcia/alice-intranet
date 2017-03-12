class Evento < ApplicationRecord
  belongs_to :tipo_evento
  has_many :tipo_servicio_evento
  has_many :tipo_servicios, through: :tipo_servicio_evento


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  after_save :save_tipo_servicios

  attr_reader :tipoServicioEvento

  	def tipoServicioEvento=(value)
	  	@tipoServicioEvento = value
	  end

  def tipo
    return self.tipo_evento
  end

  def self.titulo
    return "Evento"
  end

  def foto_url
        foto.url(:medium)
    end

   private
    def save_tipo_servicios
     TipoServicioEvento.where(:evento_id => self.id).destroy_all
     if !@tipoServicioEvento.nil?
	      @tipoServicioEvento.each do |tipo_servicio_id|
		      TipoServicioEvento.create(tipo_servicio_id: tipo_servicio_id, evento_id: self.id )
        end
	   end
   end
end
