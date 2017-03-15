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

end
