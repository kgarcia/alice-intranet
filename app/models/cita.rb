class Cita < ApplicationRecord
  belongs_to :turno
  belongs_to :persona
  belongs_to :usuario
  belongs_to :tipo_pago
  belongs_to :tipo_cita
  belongs_to :eventualidad
  has_many :evaluacion, dependent: :destroy
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
                                                       { include:  :ubicacion
                                                       }
                                                   }
                                      }
                                    }
                        }
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

  def self.contarCitasPorEventoYRangoMeses(tipo_servicio, fecha_inicio, fecha_fin)
    @citas = Cita.joins( turno: { horario: { servicio: { tipo_servicio: :eventos } } } )
    if tipo_servicio != nil
      @citas = @citas.where("tipo_servicios.id" => tipo_servicio)
    end
    if fecha_inicio != nil and fecha_fin != nil
      @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)
    end
    return @citas.count
  end

end
