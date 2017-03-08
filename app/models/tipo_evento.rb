class TipoEvento < ApplicationRecord
	has_many :eventos
  def self.titulo
	  return "Tipos de Evento"
  end

  def as_json(options={})
    super(include: :eventos)
  end
end
