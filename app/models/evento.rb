class Evento < ApplicationRecord
  belongs_to :tipo_evento

  def tipo
  	return self.tipo_evento
  end

end
