class EspecialidadesController < ApplicationController
  before_action :set_especialidad, only: [:show, :edit, :update, :destroy]

  # GET /especialidades
  # GET /especialidades.json
  def index
    @tipo = TipoEspecialidad.titulo
    @parametros = Especialidad.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /especialidades/1
  # GET /especialidades/1.json
  def show
    @parametro = Especialidad.find(params[:id])
    @collection = TipoEspecialidad.all
    @referencia = :tipo_especialidad_id
    render "parametros_select/edit"
  end

  # GET /especialidades/new
  def new
    @parametro = Especialidad.new
    @collection = TipoEspecialidad.where(:estatus => 1)
    @referencia = :tipo_especialidad_id

    render "parametros_select/new"
  end

  # GET /especialidades/1/edit
  def edit
    @parametro = Especialidad.find(params[:id])
    @collection = TipoEspecialidad.where(:estatus => 1)
    @referencia = :tipo_especialidad_id
    render "parametros_select/edit"
  end

  # POST /especialidades
  # POST /especialidades.json
  def create
    @especialidad = Especialidad.new(especialidad_params)

    respond_to do |format|
      if @especialidad.save
        format.html { redirect_to especialidades_path, notice: 'El registro ha sido creado exitosamente' }
        format.json { render :show, status: :created, location: @especialidad }
      else
        format.html { render :new }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialidades/1
  # PATCH/PUT /especialidades/1.json
  def update
    respond_to do |format|
      if @especialidad.update(especialidad_params)
        format.html { redirect_to especialidades_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @especialidad }
      else
        format.html { render :edit }
        format.json { render json: @especialidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialidades/1
  # DELETE /especialidades/1.json
  def destroy
    @especialidad.estatus = 2
    @especialidad.save
    respond_to do |format|
      format.html { redirect_to especialidades_path, alert: 'El registro ha sido eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialidad
      @especialidad = Especialidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialidad_params
      params.require(:especialidad).permit(:descripcion, :tipo_especialidad_id, :estatus)
    end
end
