class UsuariosController < ApplicationController
	def index
    	@usuarios = Usuario.all
  	end

  	def perfil
  		@usuario = current_usuario
  		@persona = @usuario.persona
  		@sexos = Sexo.where(:estatus => 1)
  	end

  	def actualizarPerfil
  		@usuario = Usuario.find(params[:usuario_id])
  		@persona = @usuario.persona
  		respond_to do |format|
	      if @persona.update(persona_params)
	        format.html { redirect_to '/perfil', notice: 'El registro ha sido actualizado exitosamente.' }
	        format.json { render :show, status: :ok, location: @persona }
	      else
	        format.html { render :edit }
	        format.json { render json: @persona.errors, status: :unprocessable_entity }
	      end
	    end
  	end

  	def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento,:sexo_id)
    end
end
