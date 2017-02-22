class LesionTipoServicio < ApplicationRecord
  belongs_to :lesion
  belongs_to :tipo_servicio
end
