class ExampleMailer < ApplicationMailer
	  default from: "kevin93ps@gmail.com"

  def sample_mail(usuario)
    @usuario = usuario
    mail(to: @usuario.email, subject: 'Sample Email')
  end

  def cita_registrada(cita)# cita)
 	@cita = cita
  @texto = PlantillaCorreo.find(1).texto.html_safe
  @email = Usuario.find(@cita.usuario_id).email
    mail(to: @email, subject: "Cita Registrada")
  end

  def cita_cancelada(cita)
      #@email = email
      @cita = cita
      @texto = PlantillaCorreo.find(2).texto.html_safe
      mail(to: cita.usuario.email, subject: "Cita Cancelada")
  end

  def difusion(difusion,email)
    @difusion = difusion
    if(@difusion.tipo_difusion_id == 1)
      @texto = PlantillaCorreo.find(3).texto.html_safe
    else
      @texto = PlantillaCorreo.find(4).texto.html_safe
    end
    @email = email
    mail(to: @email, subject: @difusion.asunto)
  end

  def usuario_creado(usuario,password)
    @usuario = usuario
    @password = password
    @texto = PlantillaCorreo.find(5).texto.html_safe
    mail(to: @usuario.email, subject: 'Alice - Usuario Creado')
  end

end
