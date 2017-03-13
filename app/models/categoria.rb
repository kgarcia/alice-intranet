class Categoria < ApplicationRecord
	has_many :tipo_servicios
	has_many :servicios, through: :tipo_servicios
	has_many :especialistas, through: :servicios
	has_many :especialidad_especialistas, through: :especialistas
  	has_many :especialidades, through: :especialidad_especialistas
	has_many :persona, through: :especialistas
	has_many :horarios, through: :servicios
	has_many :turnos, through: :horarios
	has_many :dias, through: :turnos
	has_many :ubicacion, through: :servicios

	extend FriendlyId
  	friendly_id :descripcion, use: :slugged

	def self.titulo
		return "Categoría"
	end

 def as_json(options={})
    super(include: { tipo_servicios: 
    					{ include:  {servicios: 
 {:include => { :especialista => {include: [:persona,:especialidades]}, :horarios => {:include => :turnos} , :ubicacion => {}}} 


    									
									} 
    					} 
    				})
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