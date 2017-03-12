class TipoServicioEvento < ApplicationRecord
  belongs_to :tipo_servicio
  belongs_to :evento
end
