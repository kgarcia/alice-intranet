class DiscapacidadTipoServicio < ApplicationRecord
  belongs_to :discapacidad
  belongs_to :tipo_servicio
end
