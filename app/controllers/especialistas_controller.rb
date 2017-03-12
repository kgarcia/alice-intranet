class EspecialistasController < ApplicationController
  before_action :set_especialista, only: [:show, :edit, :update, :destroy]

  # GET /especialistas
  # GET /especialistas.json
  def index
    @especialistas = Especialista.where(:estatus => 1)
  end

  # GET /especialistas/1
  # GET /especialistas/1.json
  def show
   

  end

  # GET /especialistas/new
  def new
    @especialista = Especialista.new
    @persona = Persona.new
    @especialidades = Especialidad.where(:estatus => 1)
    @universidades = Universidad.where(:estatus => 1)
    @formacion_academicas = FormacionAcademica.where(:estatus => 1)
    @sexos = Sexo.where(:estatus => 1)

  end

  # GET /especialistas/1/edit
  def edit
    @especialista = Especialista.find(params[:id])
    @persona = @especialista.persona
    @especialidades = Especialidad.where(:estatus => 1)
    @universidades = Universidad.where(:estatus => 1)
    @formacion_academicas = FormacionAcademica.where(:estatus => 1)
    @sexos = Sexo.where(:estatus => 1)
  end

  # POST /especialistas
  # POST /especialistas.json
  def create
    @especialista = Especialista.new(especialista_params)
    @persona = Persona.new(persona_params)
    
    @especialista.especialidadEspecialistas = params[:especialidades]

    respond_to do |format|
      if @persona.save
        @especialista.persona_id = @persona.id
        @especialista.save
        format.html { redirect_to especialistas_url, notice: 'Especialista was successfully created.' }
        format.json { render :show, status: :created, location: @especialista }
      else
        format.html { render :new }
        format.json { render json: @especialista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialistas/1
  # PATCH/PUT /especialistas/1.json
  def update
    @especialista.especialidadEspecialistas = params[:especialidades]
    respond_to do |format|
      if @especialista.update(especialista_params)
        @persona = @especialista.persona
        @persona.update(persona_params)
        format.html { redirect_to especialistas_url, notice: 'Especialista was successfully updated.' }
        format.json { render :show, status: :ok, location: @especialista }
      else
        format.html { render :edit }
        format.json { render json: @especialista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialistas/1
  # DELETE /especialistas/1.json
  def destroy
    @especialista.estatus = 2
    @especialista.save
    respond_to do |format|
      format.html { redirect_to especialistas_url, notice: 'Especialista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialista
      @especialista = Especialista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialista_params
      params.require(:especialista).permit(:especialidad_id, :descripcion, :estatus, :universidad_id, :formacion_academica_id, :persona_id)
    end

    def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento,:sexo_id)
    end
end
