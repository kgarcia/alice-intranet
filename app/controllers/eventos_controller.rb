class EventosController < ApplicationController
  before_action :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    @referencia_tipo = "tipo_evento"

    if params[:id].nil?
      @eventos = Evento.where(:estatus => 1)
    else
      @eventos = Evento.where(tipo_evento_id: params[:id])
    end

    respond_to do |format|
      format.html 
      format.json 
    end
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
     @evento = Evento.friendly.find(params[:id])
      respond_to do |format|
      format.html
      format.json 
    end
  end

  # GET /eventos/new
  def new
    @evento = Evento.new
    @collection = TipoEvento.where(:estatus => 1)
    @ubicaciones = Ubicacion.where(:estatus => 1)
    @referencia = :tipo_evento_id
    @tipoServicios = TipoServicio.where(:estatus => 1)
  end

  # GET /eventos/1/edit
  def edit
    @evento = Evento.friendly.find(params[:id])
    @collection = TipoEvento.where(:estatus => 1)
    @ubicaciones = Ubicacion.where(:estatus => 1)
    @referencia = :tipo_evento_id
    @tipoServicios = TipoServicio.where(:estatus => 1)
  end

  # POST /eventos
  # POST /eventos.json
  def create
    @evento = Evento.new(evento_params)
    @evento.tipoServicioEvento = params[:tipoServicios]
    respond_to do |format|
      if @evento.save
        format.html { redirect_to eventos_path, notice: 'El registro ha sido creado exitosamente.' }
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
    @evento.tipoServicioEvento = params[:tipoServicios]
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to eventos_path, notice: 'El registro ha sido actualizado exitosamente.' }
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
    @evento.estatus = 2
    @evento.save
    respond_to do |format|
      format.html { redirect_to eventos_path, notice: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evento
      @evento = Evento.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:descripcion, :estatus, :tipo_evento_id, :foto, :ubicacion_id, :fecha, :contenido)
    end
end
