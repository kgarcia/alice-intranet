class OcupacionTipoServicio < ApplicationRecord
  belongs_to :ocupacion
  belongs_to :tipo_servicio
end
