class NivelFormacionesController < ApplicationController
  before_action :set_nivel_formacion, only: [:show, :edit, :update, :destroy]

  # GET /nivel_formaciones
  # GET /nivel_formaciones.json
  def index
    @parametros = NivelFormacion.where(:estatus => 1)
        
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /nivel_formaciones/1
  # GET /nivel_formaciones/1.json
  def show
    @parametro = NivelFormacion.find(params[:id])

    render "parametros/edit"
  end

  # GET /nivel_formaciones/new
  def new
    @parametro = NivelFormacion.new
    render "parametros/new"
  end

  # GET /nivel_formaciones/1/edit
  def edit
    @parametro = NivelFormacion.find(params[:id])

    render "parametros/edit"
  end

  # POST /nivel_formaciones
  # POST /nivel_formaciones.json
  def create
    @nivel_formacion = NivelFormacion.new(nivel_formacion_params)

    respond_to do |format|
      if @nivel_formacion.save
        format.html { redirect_to nivel_formaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @nivel_formacion }
      else
        format.html { render :new }
        format.json { render json: @nivel_formacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nivel_formaciones/1
  # PATCH/PUT /nivel_formaciones/1.json
  def update
    respond_to do |format|
      if @nivel_formacion.update(nivel_formacion_params)
        format.html { redirect_to nivel_formaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @nivel_formacion }
      else
        format.html { render :edit }
        format.json { render json: @nivel_formacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nivel_formaciones/1
  # DELETE /nivel_formaciones/1.json
  def destroy
    @nivel_formacion.estatus = 2
    @nivel_formacion.save
    respond_to do |format|
      format.html { redirect_to nivel_formaciones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nivel_formacion
      @nivel_formacion = NivelFormacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nivel_formacion_params
      params.require(:nivel_formacion).permit(:descripcion, :estatus)
    end
end
