class Opinion < ApplicationRecord
  belongs_to :tipo_opinion
  belongs_to :motivo
end
