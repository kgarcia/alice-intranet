class EventualidadesController < ApplicationController
  before_action :set_eventualidad, only: [:show, :edit, :update, :destroy]

  # GET /eventualidades
  # GET /eventualidades.json
  def index
    @eventualidades = Eventualidad.where(:estatus => 1)
    @referencia_tipo = "tipo_eventualidad"
    @referencia_motivo = "motivo"
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
    @collection_tipo = TipoEventualidad.where(:estatus => 1)
    @referencia_motivo = :motivo_id
    @collection_motivo= Motivo.where(:estatus => 1)
  end

  # GET /eventualidades/1/edit
  def edit
    @eventualidad = Eventualidad.find(params[:id])
    @referencia_tipo = :tipo_eventualidad_id
    @collection_tipo = TipoEventualidad.where(:estatus => 1)
    @referencia_motivo = :motivo_id
    @collection_motivo= Motivo.where(:estatus => 1)
  end

  # POST /eventualidades
  # POST /eventualidades.json
  def create
    @eventualidad = Eventualidad.new(eventualidad_params)

    respond_to do |format|
      if @eventualidad.save
        format.html { redirect_to eventualidades_path, notice: 'El registro ha sido creado exitosamente.' }
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
        format.html { redirect_to eventualidades_path, info: 'El registro ha sido actualizado exitosamente.' }
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
    @eventualidad.estatus = 2
    @eventualidad.save
    respond_to do |format|
      format.html { redirect_to eventualidades_path, alert: 'El registro ha sido eliminado exitosamente.' }
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
