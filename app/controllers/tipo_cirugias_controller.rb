class TipoCirugiasController < ApplicationController
  before_action :set_tipo_cirugia, only: [:show, :edit, :update, :destroy]

  # GET /tipo_cirugias
  # GET /tipo_cirugias.json
  def index
    @parametros = TipoCirugia.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_cirugias/1
  # GET /tipo_cirugias/1.json
  def show
    @parametro = TipoCirugia.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_cirugias/new
  def new
    @parametro = TipoCirugia.new
    render "parametros/new"
  end

  # GET /tipo_cirugias/1/edit
  def edit
    @parametro = TipoCirugia.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_cirugias
  # POST /tipo_cirugias.json
  def create
    @tipo_cirugia = TipoCirugia.new(tipo_cirugia_params)

    respond_to do |format|
      if @tipo_cirugia.save
        format.html { redirect_to tipo_cirugias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_cirugia }
      else
        format.html { render :new }
        format.json { render json: @tipo_cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_cirugias/1
  # PATCH/PUT /tipo_cirugias/1.json
  def update
    respond_to do |format|
      if @tipo_cirugia.update(tipo_cirugia_params)
        format.html { redirect_to tipo_cirugias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_cirugia }
      else
        format.html { render :edit }
        format.json { render json: @tipo_cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_cirugias/1
  # DELETE /tipo_cirugias/1.json
  def destroy
    @tipo_cirugia.estatus = 2
    @tipo_cirugia.save
    respond_to do |format|
      format.html { redirect_to tipo_cirugias_path, alert: 'El registro ha sido eliminado exitosamente.'}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cirugia
      @tipo_cirugia = TipoCirugia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_cirugia_params
      params.require(:tipo_cirugia).permit(:descripcion, :estatus)
    end
end
