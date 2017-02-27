class ServicioEvento < ApplicationRecord
  belongs_to :servicio
  belongs_to :evento
end
