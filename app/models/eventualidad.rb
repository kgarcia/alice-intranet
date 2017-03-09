class Eventualidad < ApplicationRecord
  belongs_to :tipo_eventualidad, foreign_key: "tipo_eventualidad_id"
  belongs_to :motivo, foreign_key: "motivo_id"

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
      cita.estatus = 5 #Con estatus 5 se cancelaran las citas
      cita.eventualidad_id = self.id
      @notificacion = Notificacion.create(descripcion:"Hola", mensaje: "Su cita ha sido cancelado. Disculpe las molestias ocasionadas", url:"google.com" )
      cita.save
      ExampleMailer.cita_cancelada.deliver_now#(cita.persona.email, @cita)
    end
  end

end
