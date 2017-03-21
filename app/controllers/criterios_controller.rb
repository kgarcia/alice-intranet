class CriteriosController < ApplicationController
  before_action :set_criterio, only: [:show, :edit, :update, :destroy]

  # GET /criterios
  # GET /criterios.json
  def index
    @tipo = TipoCriterio.titulo
    @parametros = Criterio.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /criterios/1
  # GET /criterios/1.json
  def show
    @parametro = Criterio.find(params[:id])
    @collection = TipoCriterio.all
    @referencia = :tipo_criterio_id
    render "parametros_select/edit"
  end

  # GET /criterios/new
  def new
    @parametro = Criterio.new
    @collection = TipoCriterio.where(:estatus => 1)
    @referencia = :tipo_criterio_id
    render "parametros_select/new"
  end

  # GET /criterios/1/edit
  def edit
    @parametro = Criterio.find(params[:id])
    @collection = TipoCriterio.where(:estatus => 1)
    @referencia = :tipo_criterio_id
    render "parametros_select/edit"
  end

  # POST /criterios
  # POST /criterios.json
  def create
    @criterio = Criterio.new(criterio_params)

    respond_to do |format|
      if @criterio.save
        format.html { redirect_to criterios_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @criterio }
      else
        format.html { render :new }
        format.json { render json: @criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterios/1
  # PATCH/PUT /criterios/1.json
  def update
    respond_to do |format|
      if @criterio.update(criterio_params)
        format.html { redirect_to criterios_path, info: 'El registro ha sido actualizado exitosamente. ' }
        format.json { render :show, status: :ok, location: @criterio }
      else
        format.html { render :edit }
        format.json { render json: @criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterios/1
  # DELETE /criterios/1.json
  def destroy
    @criterio.estatus = 2
    @criterio.save
    respond_to do |format|
      format.html { redirect_to criterios_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterio
      @criterio = Criterio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterio_params
      params.require(:criterio).permit(:descripcion, :estatus, :tipo_criterio_id)
    end
end
