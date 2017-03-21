class TipoEvaluacionesController < ApplicationController
  before_action :set_tipo_evaluacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_evaluaciones
  # GET /tipo_evaluaciones.json
  def index
     @parametros = TipoEvaluacion.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_evaluaciones/1
  # GET /tipo_evaluaciones/1.json
  def show
    @parametro = TipoEvaluacion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_evaluaciones/new
  def new
    @parametro = TipoEvaluacion.new

    render "parametros/new"

  end

  # GET /tipo_evaluaciones/1/edit
  def edit
    @parametro = TipoEvaluacion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_evaluaciones
  # POST /tipo_evaluaciones.json
  def create
    @tipo_evaluacion = TipoEvaluacion.new(tipo_evaluacion_params)

    respond_to do |format|
      if @tipo_evaluacion.save
        format.html { redirect_to tipo_evaluaciones_path, notice: 'El registro ha sido creado exitosamente.'}
        format.json { render :show, status: :created, location: @tipo_evaluacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_evaluaciones/1
  # PATCH/PUT /tipo_evaluaciones/1.json
  def update
    respond_to do |format|
      if @tipo_evaluacion.update(tipo_evaluacion_params)
        format.html { redirect_to tipo_evaluaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_evaluacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_evaluaciones/1
  # DELETE /tipo_evaluaciones/1.json
  def destroy
    @tipo_evaluacion.estatus = 2
    @tipo_evaluacion.save
    respond_to do |format|
      format.html { redirect_to tipo_evaluaciones_path, notice: 'El registro ha sido creado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_evaluacion
      @tipo_evaluacion = TipoEvaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_evaluacion_params
      params.require(:tipo_evaluacion).permit(:descripcion, :estatus)
    end
end
