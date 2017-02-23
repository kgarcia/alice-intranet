class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :cargar_navigation
  protect_from_forgery with: :null_session


 before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:rol_id])
  end

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
