class TipoEventualidadesController < ApplicationController
  before_action :set_tipo_eventualidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_eventualidades
  # GET /tipo_eventualidades.json
  def index
    @parametros = TipoEventualidad.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_eventualidades/1
  # GET /tipo_eventualidades/1.json
  def show
    @parametro = TipoEventualidad.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_eventualidades/new
  def new
    @parametro = TipoEventualidad.new

    render "parametros/new"
  end

  # GET /tipo_eventualidades/1/edit
  def edit
    @parametro = TipoEventualidad.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_eventualidades
  # POST /tipo_eventualidades.json
  def create
    @tipo_eventualidad = TipoEventualidad.new(tipo_eventualidad_params)

    respond_to do |format|
      if @tipo_eventualidad.save
        format.html { redirect_to tipo_eventualidades_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_eventualidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_eventualidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_eventualidades/1
  # PATCH/PUT /tipo_eventualidades/1.json
  def update
    respond_to do |format|
      if @tipo_eventualidad.update(tipo_eventualidad_params)
        format.html { redirect_to tipo_eventualidades_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_eventualidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_eventualidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_eventualidades/1
  # DELETE /tipo_eventualidades/1.json
  def destroy
    @tipo_eventualidad.estatus = 2
    @tipo_eventualidad.save
    respond_to do |format|
      format.html { redirect_to tipo_eventualidades_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_eventualidad
      @tipo_eventualidad = TipoEventualidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_eventualidad_params
      params.require(:tipo_eventualidad).permit(:descripcion, :estatus)
    end
end
