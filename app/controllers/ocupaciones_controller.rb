class OcupacionesController < ApplicationController
  before_action :set_ocupacion, only: [:show, :edit, :update, :destroy]

  # GET /ocupaciones
  # GET /ocupaciones.json
  def index
    @parametros = Ocupacion.where(:estatus => 1)

        
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /ocupaciones/1
  # GET /ocupaciones/1.json
  def show
    @parametro = Ocupacion.find(params[:id])

    render "parametros/edit"
  end

  # GET /ocupaciones/new
  def new
    @parametro = Ocupacion.new
    render "parametros/new"
  end

  # GET /ocupaciones/1/edit
  def edit
    @parametro = Ocupacion.find(params[:id])

    render "parametros/edit"
  end

  # POST /ocupaciones
  # POST /ocupaciones.json
  def create
    @ocupacion = Ocupacion.new(ocupacion_params)

    respond_to do |format|
      if @ocupacion.save
        format.html { redirect_to ocupaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @ocupacion }
      else
        format.html { render :new }
        format.json { render json: @ocupacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocupaciones/1
  # PATCH/PUT /ocupaciones/1.json
  def update
    respond_to do |format|
      if @ocupacion.update(ocupacion_params)
        format.html { redirect_to ocupaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @ocupacion }
      else
        format.html { render :edit }
        format.json { render json: @ocupacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocupaciones/1
  # DELETE /ocupaciones/1.json
  def destroy
    @ocupacion.estatus = 2
    @ocupacion.save
    respond_to do |format|
      format.html { redirect_to ocupaciones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocupacion
      @ocupacion = Ocupacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocupacion_params
      params.require(:ocupacion).permit(:descripcion, :estatus)
    end
end
