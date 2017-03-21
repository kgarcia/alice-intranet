class PerfilTipoServicio < ApplicationRecord
  belongs_to :tipo_servicio
  belongs_to :perfil
end
