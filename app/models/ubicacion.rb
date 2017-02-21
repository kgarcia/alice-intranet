class Ubicacion < ApplicationRecord
  belongs_to :sector
  belongs_to :ciudad
  belongs_to :tipo_ubicacion
end
