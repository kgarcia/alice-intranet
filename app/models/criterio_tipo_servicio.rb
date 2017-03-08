class CriterioTipoServicio < ApplicationRecord
  belongs_to :criterio
  belongs_to :tipo_servicio
end
