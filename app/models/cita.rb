class Cita < ApplicationRecord
  belongs_to :turno
  belongs_to :persona
  belongs_to :usuario
  belongs_to :tipo_pago
  belongs_to :tipo_cita
  belongs_to :eventualidad
  has_many :evaluacion
  has_many :horario, through: :turno
  has_many :servicio, through: :horarios
  has_many :ubicacion, through: :servicio
  has_many :historial_citas


  def self.titulo
		return "Cita"
	end

  def as_json(options={})
    super(include: { turno: 
                       { include:  {horario: 
                                      { include:  {servicio: 
                                                       { include:  [:ubicacion,:tipo_servicio]
                                                       }
                                                   }  
                                      }
                                    }
                        },
                        :persona => {}
                      }
                      )
  end

  def estatusString
    case self.estatus
    when 1
      return "Solicitada"
    when 2
      return "Confirmada"
    when 3
      return "Atendida"
    when 4
      return "Finalizada"
    when 5
      return "Cancelada"
    else
      return "Otro"
    end
  end

  def self.contarEstatus
      @citas = Cita.all.group("estatus").count
      puts @citas
      return @citas
    end

end
