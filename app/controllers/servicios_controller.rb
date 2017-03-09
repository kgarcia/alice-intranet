class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]

  # GET /servicios
  # GET /servicios.json
  def index
    @servicios = Servicio.all
    respond_to do |format|
      format.html
      format.json { render json: @servicios.to_json }
    end
  end

  # GET /servicios/1
  # GET /servicios/1.json
  def show
    @parametro = Servicio.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @parametro.to_json }
    end
  end

  # GET /servicios/new
  def new
    @servicio = Servicio.new
    @tipo_servicios = TipoServicio.all
    @ubicaciones = Ubicacion.all
    @especialistas = Especialista.all
  end

  # GET /servicios/1/edit
  def edit
    @servicio = Servicio.find(params[:id])
    @tipo_servicios = TipoServicio.all
    @ubicaciones = Ubicacion.all
    @especialistas = Especialista.all
  end

  # POST /servicios
  # POST /servicios.json
  def create
    @servicio = Servicio.new(servicio_params)
    respond_to do |format|
      if @servicio.save
        format.html { redirect_to @servicio, notice: 'Servicio was successfully created.' }
        format.json { render :show, status: :created, location: @servicio }
      else
        format.html { render :new }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicios/1
  # PATCH/PUT /servicios/1.json
  def update
    respond_to do |format|
      if @servicio.update(servicio_params)
        format.html { redirect_to @servicio, notice: 'Servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @servicio }
      else
        format.html { render :edit }
        format.json { render json: @servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicios/1
  # DELETE /servicios/1.json
  def destroy
    @servicio.destroy
    respond_to do |format|
      format.html { redirect_to servicios_url, notice: 'Servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicio
      @servicio = Servicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicio_params
      params.require(:servicio).permit(:descripcion, :ubicacion_id, :tipo_servicio_id, :especialista_id, :estatus, :foto, :precio, :usuario_id)
    end
end
