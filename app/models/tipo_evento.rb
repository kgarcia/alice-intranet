class TipoEvento < ApplicationRecord
	has_many :eventos
  def self.titulo
	  return "Tipo de Evento"
  end
end
