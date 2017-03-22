class UsuariosController < ApplicationController
	def index
    	@usuarios = Usuario.all
  	end

    def solicitante
      @usuario = Usuario.find(:id)
      @persona = Persona.find(@usuario.persona_id)
      respond_to do |format|
        format.json {render json: @persona}
      end
    end

  	def perfil
  		@usuario = current_usuario
  		@persona = @usuario.persona
  		@sexos = Sexo.where(:estatus => 1)
  	end

    def login_movil
      @usuario = Usuario.find_by_email(params[:email])
       respond_to do |format|
          if @usuario.valid_password?(params[:password])
              format.json {render json: @usuario}
          else
              format.json {render json: @usuario.errors, status: :unprocessable_entity }
          end
        end
    end

  	def actualizarPerfil
  		@usuario = Usuario.find(params[:usuario_id])
  		@persona = @usuario.persona
  		respond_to do |format|
	      if @persona.update(persona_params)
	        format.html { redirect_to '/perfil', info: 'El registro ha sido actualizado exitosamente.' }
	        format.json { render :show, status: :ok, location: @persona }
	      else
	        format.html { render :edit }
	        format.json { render json: @persona.errors, status: :unprocessable_entity }
	      end
	    end
  	end

    def registrar
      @usuario = Usuario.new
      @persona = Persona.new
      @sexos = Sexo.where(:estatus => 1)
      @roles = Rol.all
      @servicios = Servicio.where(:estatus => 1)
    end

    def guardar
      @persona = Persona.new(persona_params)
      @persona.save
      @usuario = Usuario.new(sign_up_params)
       respond_to do |format|
      if @usuario.save
        format.html { redirect_to "/usuarios", notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :editar, status: :created, location: @usuario }
      else
        format.html { render :registrar }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
     end
    end

    def editar
      @usuario = Usuario.find(params[:id])
      @persona = @usuario.persona
      @sexos = Sexo.where(:estatus => 1)
      @roles = Rol.all
      @servicios = Servicio.where(:estatus => 1)
    end

    def modificar
      @usuario = Usuario.find(params[:usuario_id])
      @persona = @usuario.persona
      @persona.update(persona_params)
      respond_to do |format|
        if @usuario.update(sign_up_params)
          format.html { redirect_to "/usuarios", info: 'El registro ha sido actualizado exitosamente.' }
          format.json { render :editar, status: :ok, location: @usuario }
        else
          format.html { render :editar }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end

    end

    def cambiar_clave
      @usuario = current_usuario
    end

    def confirmar_clave
      @usuario = current_usuario
      respond_to do |format|
        if @usuario.update(sign_up_params)
          
          format.html { redirect_to "/usuarios/sign_in", info: 'El perfil ha sido actualizado exitosamente.' }
          format.json { render :perfil, status: :ok, location: @usuario }
        else
          format.html { render :perfil }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end

    end

  def eliminar
    @usuario = Usuario.find(params[:id])
    @usuario.estatus = 2
    @usuario.save
    respond_to do |format|
      format.html { redirect_to "/usuarios", alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  	def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento,:sexo_id)
    end
    def sign_up_params
      params.require(:usuario).permit(:persona_id, :email, :password, :password_confirmation, :rol_id, :servicio_id)
    end

    
end
