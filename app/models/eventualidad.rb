class Eventualidad < ApplicationRecord
  belongs_to :tipo_eventualidad, foreign_key: "tipo_eventualidad_id"
  belongs_to :motivo, foreign_key: "motivo_id"
  has_many :citas, dependent: :destroy
  after_save :cancelar_citas

  def tipo
      self.tipo_eventualidad
  end

  def self.titulo
	  return "Eventualidad"
  end

  private
  def cancelar_citas
    @citas = Cita.where(:fecha => self.fecha_inicio..self.fecha_fin)
    @citas.each do |cita|
      @historialCita = HistorialCita.new(fecha: DateTime.now, estatus_anterior: cita.estatus, estatus_nuevo: 5, cita:cita)
      cita.estatus = 5 #Con estatus 5 se cancelaran las citas
      cita.eventualidad_id = self.id
      if Configuracion.envia_notificaciones
        @notificacion = Notificacion.create(descripcion:"Cancelacion de cita.", mensaje: "Su cita ha sido cancelado. Disculpe las molestias ocasionadas", url:"", usuario_id:cita.usuario_id, tipo_notificacion_id: 4, entidad_id: cita.eventualidad_id )
      end
      cita.save
      @historialCita.save
      if Configuracion.envia_email
        ExampleMailer.cita_cancelada.deliver_now#(cita.persona.email, @cita)
      end
    end
  end

end
