class PerfilesController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]

  def index
    @parametros = Perfil.all
    
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
    @adicciones = Adiccion.all
    @cirugias = Cirugia.all
    @discapacidades = Discapacidad.all
    @estado_civiles = EstadoCivil.all
    @grupo_sanguineos = GrupoSanguineo.all
    @habitos = Habito.all
    @lesiones = Lesion.all
    @ocupaciones = Ocupacion.all
    @patologias = Patologia.all
    @profesiones = Profesion.all
    @sexos = Sexo.all
    @vacunas = Vacuna.all
    @rangoEdades = RangoEdad.all
    @rangoPesos = RangoPeso.all
  end

  # GET /tipo_especialidades/1/edit
  def edit
    @perfil = Perfil.find(params[:id])
    @adicciones = Adiccion.all
    @cirugias = Cirugia.all
    @discapacidades = Discapacidad.all
    @estado_civiles = EstadoCivil.all
    @grupo_sanguineos = GrupoSanguineo.all
    @habitos = Habito.all
    @lesiones = Lesion.all
    @ocupaciones = Ocupacion.all
    @patologias = Patologia.all
    @profesiones = Profesion.all
    @sexos = Sexo.all
    @vacunas = Vacuna.all
    @rangoEdades = RangoEdad.all
    @rangoPesos = RangoPeso.all
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
        format.html { redirect_to @perfil, notice: 'Perfil was successfully created.' }
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
        
        format.html { redirect_to @perfil, notice: 'Perfil was successfully updated.' }
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
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfiles_url, notice: 'Perfil was successfully destroyed.' }
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
