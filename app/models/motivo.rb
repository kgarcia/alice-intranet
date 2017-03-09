class Motivo < ApplicationRecord
  belongs_to :tipo_motivo, foreign_key: "tipo_motivo_id"
  has_many :eventualidad

  def tipo
    return self.tipo_motivo
  end

  def self.titulo
	  return "Motivo"
  end
end
