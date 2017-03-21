class PatologiaPersona < ApplicationRecord
  belongs_to :persona
  belongs_to :patologia
end
