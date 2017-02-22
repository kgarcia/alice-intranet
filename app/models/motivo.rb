class Motivo < ApplicationRecord
  belongs_to :tipo_motivo, foreign_key: "tipo_motivo_id"

  def tipo
    return self.tipo_motivo
  end
end
