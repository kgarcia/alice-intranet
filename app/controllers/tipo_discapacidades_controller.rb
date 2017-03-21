class TipoDiscapacidadesController < ApplicationController
  before_action :set_tipo_discapacidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_discapacidades
  # GET /tipo_discapacidades.json
  def index
    @parametros = TipoDiscapacidad.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_discapacidades/1
  # GET /tipo_discapacidades/1.json
  def show
    @parametro = TipoDiscapacidad.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_discapacidades/new
  def new
    @parametro = TipoDiscapacidad.new
    render "parametros/new"
  end

  # GET /tipo_discapacidades/1/edit
  def edit
    @parametro = TipoDiscapacidad.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_discapacidades
  # POST /tipo_discapacidades.json
  def create
    @tipo_discapacidad = TipoDiscapacidad.new(tipo_discapacidad_params)

    respond_to do |format|
      if @tipo_discapacidad.save
        format.html { redirect_to tipo_discapacidades_path, notice: 'El registro ha sido creado exitosamente. ' }
        format.json { render :show, status: :created, location: @tipo_discapacidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_discapacidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_discapacidades/1
  # PATCH/PUT /tipo_discapacidades/1.json
  def update
    respond_to do |format|
      if @tipo_discapacidad.update(tipo_discapacidad_params)
        format.html { redirect_to tipo_discapacidades_path, info: 'El registro ha sido actualizado exitosamente. '}
        format.json { render :show, status: :ok, location: @tipo_discapacidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_discapacidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_discapacidades/1
  # DELETE /tipo_discapacidades/1.json
  def destroy
    @tipo_discapacidad.estatus = 2
    @tipo_discapacidad.save
    respond_to do |format|
      format.html { redirect_to tipo_discapacidades_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_discapacidad
      @tipo_discapacidad = TipoDiscapacidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_discapacidad_params
      params.require(:tipo_discapacidad).permit(:descripcion, :estatus)
    end
end
