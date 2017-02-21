class HabitoTipoServicio < ApplicationRecord
  belongs_to :habito
  belongs_to :tipo_servicio
end
