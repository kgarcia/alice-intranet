class Ubicacion < ApplicationRecord
  belongs_to :ciudad
  belongs_to :tipo_ubicacion
end
