class TipoNotificacion < ApplicationRecord
	has_many :notificaciones
	def self.titulo
	  return "Tipo de Notificación"
  end
end
