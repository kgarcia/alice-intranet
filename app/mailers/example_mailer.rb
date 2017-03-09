class ExampleMailer < ApplicationMailer
	  default from: "kevin93ps@gmail.com"

  def sample_mail(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Sample Email')
  end

  def cita_registrada#(email, cita)
 	#@email = email
 	#@cita = cita
    mail(to: "kevin93ps@gmail.com", subject: "Cita Registrada")
  end

  def cita_cancelada#(email, cita)
      #@email = email
      #@cita = cita
      mail(to: "kevin93ps@gmail.com", subject: "Cita Cancelada")
  end

end
