class HomeController < ApplicationController
  def index
    @mainTitle = "Bienvenido al Sistema Alice"
    @mainDesc = "Sistema de Información Para la Gestión de Agendas y Citas de la Unidad Quirurgica 'La Trinidad'." 
  end

  def minor
  end
end
