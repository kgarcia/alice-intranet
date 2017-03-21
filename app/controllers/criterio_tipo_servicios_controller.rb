class CriterioTipoServiciosController < ApplicationController
  before_action :set_criterio_tipo_servicio, only: [:show, :edit, :update, :destroy]

  # GET /criterio_tipo_servicios
  # GET /criterio_tipo_servicios.json
  def index
    @criterio_tipo_servicios = CriterioTipoServicio.where(:estatus => 1)
  end

  # GET /criterio_tipo_servicios/1
  # GET /criterio_tipo_servicios/1.json
  def show
  end

  # GET /criterio_tipo_servicios/new
  def new
    @criterio_tipo_servicio = CriterioTipoServicio.new
  end

  # GET /criterio_tipo_servicios/1/edit
  def edit
  end

  # POST /criterio_tipo_servicios
  # POST /criterio_tipo_servicios.json
  def create
    @criterio_tipo_servicio = CriterioTipoServicio.new(criterio_tipo_servicio_params)

    respond_to do |format|
      if @criterio_tipo_servicio.save
        format.html { redirect_to @criterio_tipo_servicio, notice: 'Criterio tipo servicio was successfully created.' }
        format.json { render :show, status: :created, location: @criterio_tipo_servicio }
      else
        format.html { render :new }
        format.json { render json: @criterio_tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterio_tipo_servicios/1
  # PATCH/PUT /criterio_tipo_servicios/1.json
  def update
    respond_to do |format|
      if @criterio_tipo_servicio.update(criterio_tipo_servicio_params)
        format.html { redirect_to @criterio_tipo_servicio, notice: 'Criterio tipo servicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @criterio_tipo_servicio }
      else
        format.html { render :edit }
        format.json { render json: @criterio_tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterio_tipo_servicios/1
  # DELETE /criterio_tipo_servicios/1.json
  def destroy
    @criterio_tipo_servicio.estatus = 2
    @criterio_tipo_servicio.save
    respond_to do |format|
      format.html { redirect_to criterio_tipo_servicios_url, notice: 'Criterio tipo servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterio_tipo_servicio
      @criterio_tipo_servicio = CriterioTipoServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criterio_tipo_servicio_params
      params.require(:criterio_tipo_servicio).permit(:criterio_id, :tipo_servici_id)
    end
end
