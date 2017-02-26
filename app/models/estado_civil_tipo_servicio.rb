class EstadoCivilTipoServicio < ApplicationRecord
  belongs_to :estado_civil
  belongs_to :tipo_servicio
end
