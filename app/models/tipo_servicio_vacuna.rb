class TipoServicioVacuna < ApplicationRecord
  belongs_to :vacuna
  belongs_to :tipo_servicio
end
