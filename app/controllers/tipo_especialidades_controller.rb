class TipoEspecialidadesController < ApplicationController
  before_action :set_tipo_especialidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_especialidades
  # GET /tipo_especialidades.json
  def index
    @parametros = TipoEspecialidad.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_especialidades/1
  # GET /tipo_especialidades/1.json
  def show
    @parametro = TipoEspecialidad.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_especialidades/new
  def new
    @parametro = TipoEspecialidad.new
    render "parametros/new"
  end

  # GET /tipo_especialidades/1/edit
  def edit
    @parametro = TipoEspecialidad.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_especialidades
  # POST /tipo_especialidades.json
  def create
    @tipo_especialidad = TipoEspecialidad.new(tipo_especialidad_params)

    respond_to do |format|
      if @tipo_especialidad.save
        format.html { redirect_to tipo_especialidades_path, notice: 'El registro ha sido creado exitosamente.'}
        format.json { render :show, status: :created, location: @tipo_especialidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_especialidades/1
  # PATCH/PUT /tipo_especialidades/1.json
  def update
    respond_to do |format|
      if @tipo_especialidad.update(tipo_especialidad_params)
        format.html { redirect_to tipo_especialidades_path, info: 'El registro ha sido actualizado exitosamente.'}
        format.json { render :show, status: :ok, location: @tipo_especialidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_especialidades/1
  # DELETE /tipo_especialidades/1.json
  def destroy
    @tipo_especialidad.estatus = 2
    @tipo_especialidad.save
    respond_to do |format|
      format.html { redirect_to tipo_especialidades_path, alert: 'El registro ha sido eliminado exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_especialidad
      @tipo_especialidad = TipoEspecialidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_especialidad_params
      params.require(:tipo_especialidad).permit(:descripcion, :estatus)
    end
end
