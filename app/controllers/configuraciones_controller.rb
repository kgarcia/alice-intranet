class ConfiguracionesController < ApplicationController
  before_action :set_configuracion, only: [:show, :edit, :update, :destroy]

  # GET /configuraciones
  # GET /configuraciones.json
  def index
    @configuracion = Configuracion.find(1)
    render "edit"
  end

  # GET /configuraciones/1
  # GET /configuraciones/1.json
  def show
  end

  # GET /configuraciones/new
  def new
    @configuracion = Configuracion.new
  end

  # GET /configuraciones/1/edit
  def edit
  end

  # POST /configuraciones
  # POST /configuraciones.json
  def create
    @configuracion = Configuracion.new(configuracion_params)

    respond_to do |format|
      if @configuracion.save
        format.html { redirect_to @configuracion, notice: 'Configuracion was successfully created.' }
        format.json { render :show, status: :created, location: @configuracion }
      else
        format.html { render :new }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configuraciones/1
  # PATCH/PUT /configuraciones/1.json
  def update
    respond_to do |format|
      if @configuracion.update(configuracion_params)
        format.html { redirect_to configuraciones_url, notice: 'Configuracion actualizada exitosamene.' }
        format.json { render :show, status: :ok, location: @configuracion }
      else
        format.html { render :edit }
        format.json { render json: @configuracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configuraciones/1
  # DELETE /configuraciones/1.json
  def destroy
    @configuracion.destroy
    respond_to do |format|
      format.html { redirect_to configuraciones_url, notice: 'Configuracion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configuracion
      @configuracion = Configuracion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configuracion_params
      params.require(:configuracion).permit(:envia_email, :envia_notificaciones)
    end
end
