class PersonaVacuna < ApplicationRecord
  belongs_to :persona
  belongs_to :vacuna
end
