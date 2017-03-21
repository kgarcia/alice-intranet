class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :cargar_navigation
  #protect_from_forgery unless: -> { request.format.json? }

  #skip_before_action :verify_authenticity_token
 #protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session
  #protect_from_forgery with: :null_session, if: ->{request.format.json?}

 # before_action :koala

 before_action :configure_permitted_parameters, if: :devise_controller?

 #before_action :authenticate
 add_flash_types :error, :warning, :info, :success
 
    protected
  
  def authenticate
    token_str = params[:token]
    token = Token.find_by(token: token_str)
    
    if token.nil? or not token.is_valid? or not @my_app.is_your_token?(token)
      error!("Tu token es inválido", :unauthorized)
    else
      @current_user = token.user
    end

  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:rol_id])
  end

#https://graph.facebook.com/oauth/access_token?client_id=938437439571434&client_secret=65ddff3df089a012edc6d5a5ea11b4b5&grant_type=fb_exchange_token&fb_exchange_token=EAANVgP46xeoBAIaACL3MV24Lnd8SDP8UB8w3tqeZBJierTMyQ2aVKkEQV4SNFaXF4OZCn24p0JKIZBCF0RnPMZCdVRgw4BtjuI5JzN52w9c7JgN7D4ZBclk1OtMV90TgRjUaPBCSDlSG39picML0dDAbWkUq6MVPBzuXF2AzS4FjIaxpBazTZABLuah3ZCO6RUZD
 

   private



  def cargar_navigation

    #if current_user.nil? == false and (:controller != 'users' or :controller != 'landing_page')
    if usuario_signed_in?

      @opciones = current_usuario.rol.option_menu
      @opt_menu = current_usuario.rol.option_menu.where("num_hijos > 0")
      @opt_padres = current_usuario.rol.option_menu.select("id").where("num_hijos > 0")
      @opt_menu_child = current_usuario.rol.option_menu.where("id_padre IS NOT NULL")
      
      

#      @opt_menu = OptionMenu.select("id, id_padre, nombre, url_path, icono, controlador, accion").where("num_hijos > 0")

 #     @opt_menu_child = OptionMenu.select("id, id_padre, nombre, url_path, icono, controlador, accion").where("id_padre IS NOT NULL")

  #    @opt_padres = OptionMenu.select("id").where("num_hijos > 0")
      
      @opt_padres = @opt_padres.map { |e| e.id}

      # Todos los Niveles Principales
      #@niveles = AccesLevelRole.joins(:acces_level).select("acces_level_id, nombre, url, icono, controlador, accion").where("id_nivel_padre IS NULL AND role_id = ?", current_user.role_id)
      # Todos los Subniveles
      #@sub_niveles = AccesLevelRole.joins(:acces_level).select("acces_level_id, id_nivel_padre, nombre, url, icono, controlador, accion").where("id_nivel_padre IS NOT NULL AND role_id = ?", current_user.role_id)
      # Ids Padre de todos los Subniveles
      #@id_padres = AccesLevelRole.joins(:acces_level).select("id_nivel_padre").where("id_nivel_padre IS NOT NULL AND role_id = ?", current_user.role_id)

      #@id_padres = @id_padres.map { |e| e.id_nivel_padre}

    end

  end
end
