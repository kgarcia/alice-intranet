class Configuracion < ApplicationRecord

	def self.titulo
		return "Configuracion del Sistema"
	end

	def self.envia_email
		if Configuracion.find(1).envia_email == 1
			return true
		else
			return false
		end
	end

	def self.envia_notificaciones
		if Configuracion.find(1).envia_notificaciones == 1
			return true
		else
			return false
		end
	end
end
