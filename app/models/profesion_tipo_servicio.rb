class ProfesionTipoServicio < ApplicationRecord
  belongs_to :profesion
  belongs_to :tipo_servicio
end
