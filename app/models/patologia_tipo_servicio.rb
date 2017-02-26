class PatologiaTipoServicio < ApplicationRecord
  belongs_to :patologia
  belongs_to :tipo_servicio
end
