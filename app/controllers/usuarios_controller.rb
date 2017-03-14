class UsuariosController < ApplicationController
	def index
    @usuarios = Usuario.all
  end
end
