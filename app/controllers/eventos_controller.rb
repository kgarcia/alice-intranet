class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    @eventos = Evento.all
    @referencia_tipo = "tipo_evento"

  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
     @evento = Evento.find(params[:id])
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
    @collection = TipoEvento.all
    @referencia = :tipo_evento_id
    @servicios = Servicio.all
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.find(params[:id])
    @collection = TipoEvento.all
    @referencia = :tipo_evento_id
    @servicios = Servicio.all   
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)
    @evento.servicioEvento = params[:servicios]
    respond_to do |format|
      if @evento.save
        format.html { redirect_to action:"index", notice: 'Evento was successfully created.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to action:"index", notice: 'Evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:descripcion, :estatus, :tipo_evento_id, :foto)
    end
end
