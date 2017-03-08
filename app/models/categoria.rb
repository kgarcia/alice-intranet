class Categoria < ApplicationRecord
	has_many :tipo_servicios
	has_many :servicios, through: :tipo_servicios
	has_many :especialistas, through: :servicios
	has_many :especialidad, through: :tipo_servicios
	has_many :persona, through: :especialistas
	has_many :horarios, through: :servicios
	has_many :turnos, through: :horarios
	has_many :dias, through: :turnos

	def self.titulo
		return "Categorias"
	end

 def as_json(options={})
    super(include: { tipo_servicios: 
    					{ include:  {servicios: 
    									{include: [especialista:
    													{include: [:especialidad,
    													 :persona]},
    												horario: {include: 
    																{turnos: {include: :dias}
    																}    													
    														    }
													]
    									} 
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
	#										Especialidad
	#								Horario
	#										Turnos
	# 												Dias