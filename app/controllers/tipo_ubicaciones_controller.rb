class TipoUbicacionesController < ApplicationController
  before_action :set_tipo_ubicacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_ubicaciones
  # GET /tipo_ubicaciones.json
  def index
    @parametros = TipoUbicacion.where(:estatus => 1)
        
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_ubicaciones/1
  # GET /tipo_ubicaciones/1.json
  def show
    @parametro = TipoUbicacion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_ubicaciones/new
  def new
    @parametro = TipoUbicacion.new

    render "parametros/new"
  end

  # GET /tipo_ubicaciones/1/edit
  def edit
    @parametro = TipoUbicacion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_ubicaciones
  # POST /tipo_ubicaciones.json
  def create
    @tipo_ubicacion = TipoUbicacion.new(tipo_ubicacion_params)

    respond_to do |format|
      if @tipo_ubicacion.save
        format.html { redirect_to tipo_ubicaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_ubicacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_ubicaciones/1
  # PATCH/PUT /tipo_ubicaciones/1.json
  def update
    respond_to do |format|
      if @tipo_ubicacion.update(tipo_ubicacion_params)
        format.html { redirect_to tipo_ubicaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_ubicacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_ubicaciones/1
  # DELETE /tipo_ubicaciones/1.json
  def destroy
    @tipo_ubicacion.estatus = 2
    @tipo_ubicacion.save
    respond_to do |format|
      format.html { redirect_to tipo_ubicaciones_path, alert: 'El registro ha sido eliminado exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_ubicacion
      @tipo_ubicacion = TipoUbicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_ubicacion_params
      params.require(:tipo_ubicacion).permit(:descripcion, :estatus)
    end
end
