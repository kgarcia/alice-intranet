class TipoCalificacionesController < ApplicationController
  before_action :set_tipo_calificacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_calificaciones
  # GET /tipo_calificaciones.json
  def index
      @parametros = TipoCalificacion.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_calificaciones/1
  # GET /tipo_calificaciones/1.json
  def show
    @parametro = TipoCalificacion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_calificaciones/new
  def new
    @parametro = TipoCalificacion.new

    render "parametros/new"
  end

  # GET /tipo_calificaciones/1/edit
  def edit
    @parametro = TipoCalificacion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_calificaciones
  # POST /tipo_calificaciones.json
  def create
    @tipo_calificacion = TipoCalificacion.new(tipo_calificacion_params)

    respond_to do |format|
      if @tipo_calificacion.save
        format.html { redirect_to tipo_calificaciones_path, notice: 'El registro ha sido creado exitosamente.'}
        format.json { render :show, status: :created, location: @tipo_calificacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_calificaciones/1
  # PATCH/PUT /tipo_calificaciones/1.json
  def update
    respond_to do |format|
      if @tipo_calificacion.update(tipo_calificacion_params)
        format.html { redirect_to tipo_calificaciones_path, info: 'El registro ha sido actualizado exitosamente.'}
        format.json { render :show, status: :ok, location: @tipo_calificacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_calificaciones/1
  # DELETE /tipo_calificaciones/1.json
  def destroy
    @tipo_calificacion.estatus = 2
    @tipo_calificacion.save
    respond_to do |format|
      format.html { redirect_to tipo_calificaciones_path, notice: 'El registro ha sido creado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_calificacion
      @tipo_calificacion = TipoCalificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_calificacion_params
      params.require(:tipo_calificacion).permit(:descripcion, :estatus)
    end
end
