class TipoEvento < ApplicationRecord
	has_many :eventos
  def self.titulo
	  return "Tipos de Evento"
  end
end
