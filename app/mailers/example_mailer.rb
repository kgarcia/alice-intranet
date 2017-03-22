class ExampleMailer < ApplicationMailer
	  default from: "kevin93ps@gmail.com"

  def sample_mail(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Sample Email')
  end

  def cita_registrada(cita)# cita)
 	@cita = cita
  @email = Usuario.find(@cita.usuario_id).email
    mail(to: @email, subject: "Cita Registrada")
  end

  def cita_cancelada#(email, cita)
      #@email = email
      #@cita = cita
      mail(to: "kevin93ps@gmail.com", subject: "Cita Cancelada")
  end

  def difusion(difusion,email)
    @difusion = difusion
    @email = email
    mail(to: @email, subject: @difusion.asunto)
  end

end
