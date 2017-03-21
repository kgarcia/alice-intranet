class Motivo < ApplicationRecord
  belongs_to :tipo_motivo, foreign_key: "tipo_motivo_id"
  has_many :eventualidad, dependent: :destroy

  def tipo
    return self.tipo_motivo
  end

  def self.titulo
	  return "Motivo"
  end

  def self.contarCitas
    @citas = Motivo.joins(eventualidad: :citas).group("motivos.descripcion").count
    return @citas
  end

end
