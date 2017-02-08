class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :cargar_navigation
  protect_from_forgery with: :exception




   private

  def cargar_navigation

    #if current_user.nil? == false and (:controller != 'users' or :controller != 'landing_page')
      @opt_menu = OptionMenu.select("id, id_padre, nombre, url_path, icono, controlador, accion").where("num_hijos > 0")

      @opt_menu_child = OptionMenu.select("id, id_padre, nombre, url_path, icono, controlador, accion").where("id_padre IS NOT NULL")

      @opt_padres = OptionMenu.select("id").where("num_hijos > 0")
      
      @opt_padres = @opt_padres.map { |e| e.id}

      # Todos los Niveles Principales
      #@niveles = AccesLevelRole.joins(:acces_level).select("acces_level_id, nombre, url, icono, controlador, accion").where("id_nivel_padre IS NULL AND role_id = ?", current_user.role_id)
      # Todos los Subniveles
      #@sub_niveles = AccesLevelRole.joins(:acces_level).select("acces_level_id, id_nivel_padre, nombre, url, icono, controlador, accion").where("id_nivel_padre IS NOT NULL AND role_id = ?", current_user.role_id)
      # Ids Padre de todos los Subniveles
      #@id_padres = AccesLevelRole.joins(:acces_level).select("id_nivel_padre").where("id_nivel_padre IS NOT NULL AND role_id = ?", current_user.role_id)

      #@id_padres = @id_padres.map { |e| e.id_nivel_padre}

    #end

  end
end
