class GrupoSanguineoTipoServicio < ApplicationRecord
  belongs_to :grupo_sanguineo
  belongs_to :tipo_servicio
end
