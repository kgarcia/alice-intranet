class PerfilesController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]

  def index
    @parametros = Perfil.where(:estatus => 1)
    
    respond_to do |format|
      format.html { render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_especialidades/1
  # GET /tipo_especialidades/1.json
  def show
    @perfil = Perfil.find(params[:id])

  end

  # GET /tipo_especialidades/new
  def new
    @perfil = Perfil.new
    @adicciones = Adiccion.where(:estatus => 1)
    @cirugias = Cirugia.where(:estatus => 1)
    @discapacidades = Discapacidad.where(:estatus => 1)
    @estado_civiles = EstadoCivil.where(:estatus => 1)
    @grupo_sanguineos = GrupoSanguineo.where(:estatus => 1)
    @habitos = Habito.where(:estatus => 1)
    @lesiones = Lesion.where(:estatus => 1)
    @ocupaciones = Ocupacion.where(:estatus => 1)
    @patologias = Patologia.where(:estatus => 1)
    @profesiones = Profesion.where(:estatus => 1)
    @sexos = Sexo.where(:estatus => 1)
    @vacunas = Vacuna.where(:estatus => 1)
    @rangoEdades = RangoEdad.where(:estatus => 1)
    @rangoPesos = RangoPeso.where(:estatus => 1)
  end

  # GET /tipo_especialidades/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
    @adicciones = Adiccion.where(:estatus => 1)
    @cirugias = Cirugia.where(:estatus => 1)
    @discapacidades = Discapacidad.where(:estatus => 1)
    @estado_civiles = EstadoCivil.where(:estatus => 1)
    @grupo_sanguineos = GrupoSanguineo.where(:estatus => 1)
    @habitos = Habito.where(:estatus => 1)
    @lesiones = Lesion.where(:estatus => 1)
    @ocupaciones = Ocupacion.where(:estatus => 1)
    @patologias = Patologia.where(:estatus => 1)
    @profesiones = Profesion.where(:estatus => 1)
    @sexos = Sexo.where(:estatus => 1)
    @vacunas = Vacuna.where(:estatus => 1)
    @rangoEdades = RangoEdad.where(:estatus => 1)
    @rangoPesos = RangoPeso.where(:estatus => 1)
  end

  # POST /perfiles
  # POST /perfiles.json
  def create
    @perfil = Perfil.new(perfil_params)
    @perfil.adiccionesPerfil = params[:adicciones]
    @perfil.cirugiasPerfil = params[:cirugias]
    @perfil.discapacidadesPerfil = params[:discapacidades]
    @perfil.estadoCivilesPerfil = params[:estado_civiles]
    @perfil.grupoSanguineosPerfil = params[:grupo_sanguineos]
    @perfil.habitosPerfil = params[:habitos]
    @perfil.lesionesPerfil = params[:lesiones]
    @perfil.ocupacionesPerfil = params[:ocupaciones]
    @perfil.patologiasPerfil = params[:patologias]
    @perfil.profesionesPerfil = params[:profesiones]
    @perfil.sexosPerfil = params[:sexos]
    @perfil.vacunasPerfil = params[:vacunas]
    @perfil.rangoEdadesPerfil = params[:rango_edades]
    @perfil.rangoPesosPerfil = params[:rango_pesos]

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to perfiles_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfiles/1
  # PATCH/PUT /perfiles/1.json
  def update
        @perfil.adiccionesPerfil = params[:adicciones]
        @perfil.cirugiasPerfil = params[:cirugias]
        @perfil.discapacidadesPerfil = params[:discapacidades]
        @perfil.estadoCivilesPerfil = params[:estado_civiles]
        @perfil.grupoSanguineosPerfil = params[:grupo_sanguineos]
        @perfil.habitosPerfil = params[:habitos]
        @perfil.lesionesPerfil = params[:lesiones]
        @perfil.ocupacionesPerfil = params[:ocupaciones]
        @perfil.patologiasPerfil = params[:patologias]
        @perfil.profesionesPerfil = params[:profesiones]
        @perfil.sexosPerfil = params[:sexos]
        @perfil.vacunasPerfil = params[:vacunas]
        @perfil.rangoEdadesPerfil = params[:rango_edades]
        @perfil.rangoPesosPerfil = params[:rango_pesos]
    respond_to do |format|
      if @perfil.update(perfil_params)
        
        format.html { redirect_to perfiles_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfiles/1
  # DELETE /perfiles/1.json
  def destroy
    @perfil.estatus = 2
    @perfil.save
    respond_to do |format|
      format.html { redirect_to perfiles_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit(:descripcion, :estatus)
    end
end
