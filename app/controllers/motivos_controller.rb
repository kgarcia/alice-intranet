class MotivosController < ApplicationController
  before_action :set_motivo, only: [:show, :edit, :update, :destroy]

  # GET /motivos
  # GET /motivos.json
  def index
    @tipo = TipoMotivo.titulo
    @parametros = Motivo.where(:estatus => 1)
    @referencia = "tipoMotivo"
    
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /motivos/1
  # GET /motivos/1.json
  def show
    @parametro = Motivo.find(params[:id])

    render "parametros_select/show"
  end

  # GET /motivos/new
  def new
    @parametro = Motivo.new 
    @collection = TipoMotivo.where(:estatus => 1)
    @referencia = :tipo_motivo_id

    render "parametros_select/new"
  end

  # GET /motivos/1/edit
  def edit

    @parametro = Motivo.find(params[:id])
    @collection = TipoMotivo.where(:estatus => 1)
    @referencia = :tipo_motivo_id

    render "parametros_select/edit"

  end

  # POST /motivos
  # POST /motivos.json
  def create
    @motivo = Motivo.new(motivo_params)

    respond_to do |format|
      if @motivo.save
        format.html { redirect_to motivos_path, notice: 'El registro ha sido creado exitosamente. ' }
        format.json { render :show, status: :created, location: @motivo }
      else
        format.html { render :new }
        format.json { render json: @motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivos/1
  # PATCH/PUT /motivos/1.json
  def update
    respond_to do |format|
      if @motivo.update(motivo_params)
        format.html { redirect_to motivos_path, info: 'El registro ha sido actualizado exitosamente. ' }
        format.json { render :show, status: :ok, location: @motivo }
      else
        format.html { render :edit }
        format.json { render json: @motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivos/1
  # DELETE /motivos/1.json
  def destroy
    @motivo.estatus = 2
    @motivo.save
    respond_to do |format|
      format.html { redirect_to motivos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivo
      @motivo = Motivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivo_params
      params.require(:motivo).permit(:descripcion, :estatus, :tipo_motivo_id)
    end
end
