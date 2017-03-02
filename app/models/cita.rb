class Cita < ApplicationRecord
  belongs_to :turno
  belongs_to :persona
  belongs_to :usuario
  belongs_to :tipo_pago
  belongs_to :tipo_cita
  belongs_to :eventualidad
  belongs_to :evaluacion

  def self.titulo
		return "Citas"
	end
end
