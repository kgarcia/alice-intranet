class ExampleMailer < ApplicationMailer
	  default from: "kevin93ps@gmail.com"

  def sample_mail(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Sample Email')
  end

  def cita_registrada(usuario, cita)
 	@usuario = usuario
 	@cita = cita
    mail(to: @usuario.email, subject: "Cita Registrada")
  end

end
