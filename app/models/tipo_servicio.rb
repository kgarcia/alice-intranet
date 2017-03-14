class TipoServicio < ApplicationRecord
	belongs_to :tipo_atencion
  belongs_to :categoria
  belongs_to :especialidad
  has_many :servicios
  has_many :tipo_servicio_evento
  has_many :eventos, through: :servicio_evento
  has_many :criterio_tipo_servicios
  has_many :criterios, through: :criterio_tipo_servicios
  has_many :perfil_tipo_servicios
  has_many :perfiles, through: :perfil_tipo_servicios

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  	after_save :save_criterios, :save_perfiles

    attr_reader :criteriosTipoServicio, :perfilesTipoServicio
   
     extend FriendlyId
     friendly_id :descripcion, use: :slugged

    def criteriosTipoServicio=(value)
      @criteriosTipoServicio = value
    end

    def perfilesTipoServicio=(value)
      @perfilesTipoServicio = value
    end

  def self.titulo
    return "Tipo de Servicio"
  end
   private
   def save_criterios
    CriterioTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@criteriosTipoServicio.nil?
        @criteriosTipoServicio.each do |criterio_id|
          CriterioTipoServicio.create(criterio_id: criterio_id, tipo_servicio_id: self.id )
        end
     end
   end

   private
   def save_perfiles
    PerfilTipoServicio.where(:tipo_servicio_id => self.id).destroy_all
    if !@perfilesTipoServicio.nil?
        @perfilesTipoServicio.each do |perfil_id|
          PerfilTipoServicio.create(perfil_id: perfil_id, tipo_servicio_id: self.id )
        end
     end
   end

  

end
