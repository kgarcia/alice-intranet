class CalificacionesController < ApplicationController
  before_action :set_calificacion, only: [:show, :edit, :update, :destroy]

  # GET /calificaciones
  # GET /calificaciones.json
  def index
    @parametros = Calificacion.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end  end

  # GET /calificaciones/1
  # GET /calificaciones/1.json
  def show
  end

  # GET /calificaciones/new
  def new
    @parametro = Calificacion.new
    @collection = TipoCalificacion.where(:estatus => 1)
    @referencia = :tipo_calificacion_id
    render "parametros_select/new"
  end

  # GET /calificaciones/1/edit
  def edit
    @parametro = Calificacion.find(params[:id])
    @collection = TipoCalificacion.where(:estatus => 1)
    @referencia = :tipo_calificacion_id
    render "parametros_select/edit"
  end

  # POST /calificaciones
  # POST /calificaciones.json
  def create
    @calificacion = Calificacion.new(calificacion_params)

    respond_to do |format|
      if @calificacion.save
        format.html { redirect_to calificaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @calificacion }
      else
        format.html { render :new }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calificaciones/1
  # PATCH/PUT /calificaciones/1.json
  def update
    respond_to do |format|
      if @calificacion.update(calificacion_params)
        format.html { redirect_to calificaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @calificacion }
      else
        format.html { render :edit }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificaciones/1
  # DELETE /calificaciones/1.json
  def destroy
    @calificacion.estatus = 2
    @calificacion.save
    respond_to do |format|
      format.html { redirect_to calificaciones_url, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calificacion
      @calificacion = Calificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calificacion_params
      params.require(:calificacion).permit(:descripcion, :estatus, :tipo_calificacion_id)
    end
end
