class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista
  belongs_to :responsable     
  
  has_one :horario
  has_many :servicio_evento
  has_many :eventos, through: :servicio_evento


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

    attr_reader :horario, :turno #ño
    after_save :save_horario_turnos

  def self.titulo
	  return "Servicios"
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




