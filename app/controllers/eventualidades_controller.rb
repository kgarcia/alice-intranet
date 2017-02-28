class EventualidadesController < ApplicationController
  before_action :set_eventualidad, only: [:show, :edit, :update, :destroy]

  # GET /eventualidades
  # GET /eventualidades.json
  def index
    @parametros = Eventualidad.all
    @referencia_tipo = "tipo_eventualidad"
    @referencia_motivo = "motivo"

    render "parametros_select/index"
  end

  # GET /eventualidades/1
  # GET /eventualidades/1.json
  def show
    @parametros = Eventualidad.find(params[:id])
  end

  # GET /eventualidades/new
  def new
    @eventualidad = Eventualidad.new
    @referencia_tipo = :tipo_eventualidad_id
    @collection_tipo = TipoEventualidad.all
    @referencia_motivo = :motivo_id
    @collection_motivo= Motivo.all
  end

  # GET /eventualidades/1/edit
  def edit
    @eventualidad = Eventualidad.find(params[:id])
    @referencia_tipo = :tipo_eventualidad_id
    @collection_tipo = TipoEventualidad.all
    @referencia_motivo = :motivo_id
    @collection_motivo= Motivo.all
  end

  # POST /eventualidades
  # POST /eventualidades.json
  def create
    @eventualidad = Eventualidad.new(eventualidad_params)

    respond_to do |format|
      if @eventualidad.save
        @citas = Cita.where(:fecha => @eventualidad.fecha_inicio..@eventualidad.fecha_fin)
        @citas.each do |cita|
          cita.estatus = 10 #Con estatus 10 se eliminaran las citas oscar lo va a cambiar
          cita.eventualidad_id = @eventualidad.id
          cita.save
        end
        format.html { redirect_to action:"index", notice: 'Eventualidad was successfully created.' }
        format.json { render :show, status: :created, location: @eventualidad }
      else
        format.html { render :new }
        format.json { render json: @eventualidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventualidades/1
  # PATCH/PUT /eventualidades/1.json
  def update
    respond_to do |format|
      if @eventualidad.update(eventualidad_params)
        format.html { redirect_to action:"index", notice: 'Eventualidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventualidad }
      else
        format.html { render :edit }
        format.json { render json: @eventualidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventualidades/1
  # DELETE /eventualidades/1.json
  def destroy
    @eventualidad.destroy
    respond_to do |format|
      format.html { redirect_to eventualidades_url, notice: 'Eventualidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventualidad
      @eventualidad = Eventualidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventualidad_params
      params.require(:eventualidad).permit(:descripcion, :estatus, :tipo_eventualidad_id, :motivo_id, :fecha_inicio, :fecha_fin)
    end
end
