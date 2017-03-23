class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :edit, :update, :destroy]

  # GET /servicios
  # GET /servicios.json
  def index
    puts params.to_json
if params[:slug].nil?
      @servicios = Servicio.where(:estatus => 1)
    else
      @tipo_servicio_id = TipoServicio.where(slug: params["slug"]).take.id
      @servicios = Servicio.where(tipo_servicio_id: @tipo_servicio_id, estatus: 1)
      puts '@@@@@!asdq'
      puts @servicios
    end

    respond_to do |format|
      format.html
      format.json { render json: @servicios.to_json }
    end
  end

  def filtrar
    @servicios = Servicio.where(tipo_servicio_id: params[:tipo_servicio_id])
    respond_to do |format|
      format.html
      format.json { render json: @servicios.to_json }
    end
  end

  # GET /servicios/1
  # GET /servicios/1.json
  def show
    @parametro = Servicio.friendly.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @parametro.to_json }
    end
  end

  # GET /servicios/new
  def new
    @servicio = Servicio.new
    @tipo_servicios = TipoServicio.where(:estatus => 1)
    @ubicaciones = Ubicacion.where(:estatus => 1)
    @especialistas = Especialista.where(:estatus => 1)
  end

  # GET /servicios/1/edit
  def edit
    @servicio = Servicio.friendly.find(params[:id])
    @tipo_servicios = TipoServicio.where(:estatus => 1)
    @ubicaciones = Ubicacion.where(:estatus => 1)
    @especialistas = Especialista.where(:estatus => 1)
  end

  # POST /servicios
  # POST /servicios.json
  def create
    @servicio = Servicio.new(servicio_params)
    respond_to do |format|
      if @servicio.save
        format.html { redirect_to servicios_path, notice: 'El registro ha sido creado exitosamente.' }
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
        format.html { redirect_to servicios_path, notice: 'El registro ha sido actualizado exitosamente.'}
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
    @servicio.estatus = 2
    @servicio.save
    respond_to do |format|
      format.html { redirect_to servicios_path, notice: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def update_especialistas
    if (TipoServicio.find(params[:tipo_servicio_id].to_i).tipo_atencion_id == 1)
      @tieneEspecialista = true  
    else
      @tieneEspecialista = false
    end
    @especialistas = Especialista.joins( especialidades: :tipo_servicios).where("especialistas.estatus" => 1).where("tipo_servicios.id" => TipoServicio.find(params[:tipo_servicio_id].to_i).id) 
    
    respond_to do |format|
      format.js
      render 'servicios/update_especialistas'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicio
      @servicio = Servicio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicio_params
      params.require(:servicio).permit(:descripcion, :ubicacion_id, :tipo_servicio_id, :especialista_id, :estatus, :foto, :precio)
    end
end
