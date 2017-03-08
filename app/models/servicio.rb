class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista

  has_many :horarios
  has_many :servicio_evento
  has_many :eventos, through: :servicio_evento
  has_many :usuarios
  has_many :turnos, through: :horarios
  has_many :dia, through: :turnos
  has_many :citas, through: :turnos
  has_many :evaluaciones, through: :citas
  has_many :calificaciones, through: :evaluaciones
  has_many :criterios, through: :calificaciones


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

   
    after_save :save_horario_turnos

  def self.titulo
	  return "Servicio"
  end

  def contarCalificaciones
    return self.criterios.count
  end



 def as_json(options={})
    super(include: { horarios: {include: 
                                    {turnos: {include: :dia}
                                    }                             
                              }
                          }              
               )
  end
private
def save_horario_turnos

        @horarioNuevo = Horario.create(tiempo_cita: 0,estatus: 1, tipo_horario: TipoHorario.first,servicio_id: self.id)
       for i in 1..7
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "08:00:00" , hora_fin: "08:00:00",estatus: 1,dia_id: i, tipo_turno_id: 1)
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "13:00:00" , hora_fin: "13:00:00",estatus: 1,dia_id: i, tipo_turno_id: 2)

       end
end

end




