class ServicioEventosController < ApplicationController
  before_action :set_servicio_evento, only: [:show, :edit, :update, :destroy]

  # GET /servicio_eventos
  # GET /servicio_eventos.json
  def index
    @servicio_eventos = ServicioEvento.where(:estatus => 1)
  end

  # GET /servicio_eventos/1
  # GET /servicio_eventos/1.json
  def show
  end

  # GET /servicio_eventos/new
  def new
    @servicio_evento = ServicioEvento.new
    @eventos = Evento.where(:estatus => 1)
    @servicios = Servicio.where(:estatus => 1)
  end

  # GET /servicio_eventos/1/edit
  def edit
    @servicio_evento = ServicioEvento.new
    @eventos = Evento.where(:estatus => 1)
    @servicios = Servicio.where(:estatus => 1)
  end

  # POST /servicio_eventos
  # POST /servicio_eventos.json
  def create
    @servicio_evento = ServicioEvento.new(servicio_evento_params)

    respond_to do |format|
      if @servicio_evento.save
        format.html { redirect_to @servicio_evento, notice: 'Servicio evento was successfully created.' }
        format.json { render :show, status: :created, location: @servicio_evento }
      else
        format.html { render :new }
        format.json { render json: @servicio_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicio_eventos/1
  # PATCH/PUT /servicio_eventos/1.json
  def update
    respond_to do |format|
      if @servicio_evento.update(servicio_evento_params)
        format.html { redirect_to @servicio_evento, notice: 'Servicio evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @servicio_evento }
      else
        format.html { render :edit }
        format.json { render json: @servicio_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicio_eventos/1
  # DELETE /servicio_eventos/1.json
  def destroy
    @servicio_evento.estatus = 2
    @servicio_evento.save
    respond_to do |format|
      format.html { redirect_to servicio_eventos_url, notice: 'Servicio evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicio_evento
      @servicio_evento = ServicioEvento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicio_evento_params
      params.require(:servicio_evento).permit(:descripcion, :estatus, :servicio_id, :evento_id)
    end
end
