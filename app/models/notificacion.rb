class Notificacion < ApplicationRecord
  belongs_to :tipo_notificacion


  def self.titulo
    return "Notificaciones"
  end

  def tipo
    self.tipo_notificacion
  end

  def enlace
  	return self.url
  end

end
