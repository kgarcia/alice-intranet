class EspecialidadEspecialista < ApplicationRecord
  belongs_to :especialidad
  belongs_to :especialista
end
