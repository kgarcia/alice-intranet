class Usuarios::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
def new
  @roles = Rol.all
  @servicios = Servicio.where(:estatus => 1)
  @sexos = Sexo.where(:estatus => 1)
  @persona = Persona.new
  super
end

  # POST /resource
   def create
     @persona = Persona.new(persona_params)
     @persona.save
    
    respond_to do |format|
      format.html {
        super
      }
      format.json {
        @user = Usuario.create(sign_up_params)
        @user.save ? (render :json => {:data => @user }) : 
                     (render :json => {:messages => @user.errors.full_messages})
      }
     #ExampleMailer.sample_mail(Usuario.last).deliver_now
   end
 end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

#def sign_up_params
#  devise_parameter_sanitizer.sanitize(:sign_up)
#end

#def account_update_params
#  devise_parameter_sanitizer.sanitize(:account_update)
#end

private

  def sign_up_params
    params.require(:usuario).permit(:persona_id, :email, :password, :password_confirmation, :rol_id, :servicio_id)
  end

  #def account_update_params
    #params.require(:usuario).permit(:email, :password, :password_confirmation:current_password)
  #end

  def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento, :sexo_id)
    end
end
