class TipoServiciosController < ApplicationController
  before_action :set_tipo_servicio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_servicios
  # GET /tipo_servicios.json
  def index
    @tipo_servicios = TipoServicio.all
  end

  # GET /tipo_servicios/1
  # GET /tipo_servicios/1.json
  def show
  end

  # GET /tipo_servicios/new
  def new
    @tipo_servicio = TipoServicio.new
    @tipos_atencion = TipoAtencion.all
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
    @vacunas = Vacuna.all
  end

  # GET /tipo_servicios/1/edit
  def edit
    @tipos_atencion = TipoAtencion.all
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
    @vacunas = Vacuna.all

  end

  # POST /tipo_servicios
  # POST /tipo_servicios.json
  def create
    @tipo_servicio = TipoServicio.new(tipo_servicio_params)
    @tipo_servicio.adiccionesTipoServicio = params[:adicciones]
    @tipo_servicio.cirugiasTipoServicio = params[:cirugias]
    @tipo_servicio.discapacidadesTipoServicio = params[:discapacidades]
    @tipo_servicio.estadoCivilesTipoServicio = params[:estado_civiles]
    @tipo_servicio.grupoSanguineosTipoServicio = params[:grupo_sanguineos]
    @tipo_servicio.habitosTipoServicio = params[:habitos]
    @tipo_servicio.lesionesTipoServicio = params[:lesiones]
    @tipo_servicio.ocupacionesTipoServicio = params[:ocupaciones]
    @tipo_servicio.patologiasTipoServicio = params[:patologias]
    @tipo_servicio.profesionesTipoServicio = params[:profesiones]
    @tipo_servicio.vacunasTipoServicio = params[:vacunas]

    respond_to do |format|     
      if @tipo_servicio.save
        puts @tipo_servicio.inspect
        format.html { redirect_to @tipo_servicio, notice: 'Tipo servicio was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_servicio }
      else
        format.html { render :new }
        format.json { render json: @tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_servicios/1
  # PATCH/PUT /tipo_servicios/1.json
  def update
    @tipo_servicio.adicciones = params[:adicciones]
    @tipo_servicio.cirugiasTipoServicio = params[:cirugias]

    respond_to do |format|
      if @tipo_servicio.update(tipo_servicio_params)
        format.html { redirect_to @tipo_servicio, notice: 'Tipo servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_servicio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_servicios/1
  # DELETE /tipo_servicios/1.json
  def destroy
    @tipo_servicio.destroy
    respond_to do |format|
      format.html { redirect_to tipo_servicios_url, notice: 'Tipo servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_servicio
      @tipo_servicio = TipoServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_servicio_params
      params.require(:tipo_servicio).permit(:descripcion, :texto, :foto, :estatus, :tipo_atencion_id)
    end
end
