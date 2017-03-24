class Categoria < ApplicationRecord
	has_many :tipo_servicios, dependent: :destroy
	has_many :servicios, through: :tipo_servicios, dependent: :destroy
  has_many :criterios_tipo_servicios, through: :servicios, dependent: :destroy
	has_many :criterios, through: :criterios_tipo_servicios, dependent: :destroy
  has_many :tipo_criterio, through: :criterios, dependent: :destroy
	has_many :especialistas, through: :servicios, dependent: :destroy
	has_many :especialidad_especialistas, through: :especialistas, dependent: :destroy
  has_many :especialidades, through: :especialidad_especialistas, dependent: :destroy
	has_many :persona, through: :especialistas, dependent: :destroy
	has_many :horarios, through: :servicios, dependent: :destroy
	has_many :turnos, through: :horarios, dependent: :destroy
	has_many :dias, through: :turnos, dependent: :destroy
	has_many :ubicacion, through: :servicios, dependent: :destroy

	has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
	  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

	extend FriendlyId
  	friendly_id :descripcion, use: :slugged

	def self.titulo
		return "Categoría"
	end


  def foto_url
        url+foto.url(:medium)
    end


 def as_json(options={})
    super(include: { tipo_servicios: { :include => {:criterios => {:include => :tipo_criterio}, :servicios => {:methods => :foto_url,:include => {  :especialista => {include: [:persona,:especialidades]},  :horarios => {:include => :turnos,:methods => :turnos_ordenados} , :ubicacion => {}}}}}})
  end
end
#:include => [:posts, :roles]
	#		Categoria
	#				TipoServicio
	#						Servicio
	#								Especialista
	# 										Persona
	#										Especialidad
	#								Horario
	#										Turnos
	# 												Dias