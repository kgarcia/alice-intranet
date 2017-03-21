class TipoCriteriosController < ApplicationController
  before_action :set_tipo_criterio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_criterios
  # GET /tipo_criterios.json
  def index
    @parametros = TipoCriterio.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end

  end

  # GET /tipo_criterios/1
  # GET /tipo_criterios/1.json
  def show
    @parametro = TipoCriterio.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_criterios/new
  def new
    @parametro = TipoCriterio.new

    render "parametros/new"
  end

  # GET /tipo_criterios/1/edit
  def edit
    @parametro = TipoCriterio.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_criterios
  # POST /tipo_criterios.json
  def create
    @tipo_criterio = TipoCriterio.new(tipo_criterio_params)

    respond_to do |format|
      if @tipo_criterio.save
        format.html { redirect_to tipo_criterios_path, notice: 'El registro ha sido creado exitosamente. ' }
        format.json { render :show, status: :created, location: @tipo_criterio }
      else
        format.html { render :new }
        format.json { render json: @tipo_criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_criterios/1
  # PATCH/PUT /tipo_criterios/1.json
  def update
    respond_to do |format|
      if @tipo_criterio.update(tipo_criterio_params)
        format.html { redirect_to tipo_criterios_path, info: 'El registro ha sido actualizado exitosamente. ' }
        format.json { render :show, status: :ok, location: @tipo_criterio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_criterio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_criterios/1
  # DELETE /tipo_criterios/1.json
  def destroy
    @tipo_criterio.estatus = 2
    @tipo_criterio.save
    respond_to do |format|
      format.html { redirect_to tipo_criterios_path, info: 'El registro ha sido actualizado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_criterio
      @tipo_criterio = TipoCriterio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_criterio_params
      params.require(:tipo_criterio).permit(:descripcion, :estatus)
    end
end
