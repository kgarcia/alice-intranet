class PatologiaPerfil < ApplicationRecord
  belongs_to :patologia
  belongs_to :perfil
end
