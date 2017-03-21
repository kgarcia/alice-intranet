class UbicacionesController < ApplicationController
  before_action :set_ubicacion, only: [:show, :edit, :update, :destroy]

  # GET /ubicaciones
  # GET /ubicaciones.json
  def index
    @parametros = Ubicacion.where(:estatus => 1)
  end

  # GET /ubicaciones/1
  # GET /ubicaciones/1.json
  def show
  @parametro = Ubicacion.find(params[:id])
  end

  # GET /ubicaciones/new
  def new
    @parametro = Ubicacion.new
    @tipoUbicaciones = TipoUbicacion.where(:estatus => 1)
    @ciudades = Ciudad.where(:estatus => 1)
    @sectores = Sector.where(:estatus => 1)
  end

  # GET /ubicaciones/1/edit
  def edit  
  @parametro = Ubicacion.find(params[:id])
  end

  # POST /ubicaciones
  # POST /ubicaciones.json
  def create
    @ubicacion = Ubicacion.new(ubicacion_params)

    respond_to do |format|
      if @ubicacion.save
        format.html { redirect_to ubicaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @ubicacion }
      else
        format.html { render :new }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubicaciones/1
  # PATCH/PUT /ubicaciones/1.json
  def update
    respond_to do |format|
      if @ubicacion.update(ubicacion_params)
        format.html { redirect_to ubicaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @ubicacion }
      else
        format.html { render :edit }
        format.json { render json: @ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubicaciones/1
  # DELETE /ubicaciones/1.json
  def destroy
    @ubicacion.estatus = 2
    @ubicacion.save
    respond_to do |format|
      format.html { redirect_to ubicaciones_path, alert: 'El registro ha sido eliminado exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubicacion
      @ubicacion = Ubicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ubicacion_params
      params.require(:ubicacion).permit(:descripcion, :estatus, :sector_id, :ciudad_id, :tipo_ubicacion_id)
    end
end
