class Persona < ApplicationRecord
  belongs_to :sexo
  has_one :usuario
end
