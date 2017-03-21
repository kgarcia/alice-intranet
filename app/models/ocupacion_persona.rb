class OcupacionPersona < ApplicationRecord
  belongs_to :persona
  belongs_to :ocupacion
end
