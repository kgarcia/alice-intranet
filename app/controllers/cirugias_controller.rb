class CirugiasController < ApplicationController
  before_action :set_cirugia, only: [:show, :edit, :update, :destroy]

  # GET /cirugias
  # GET /cirugias.json
  def index
    @tipo = TipoCirugia.titulo
    @parametros = Cirugia.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /cirugias/1
  # GET /cirugias/1.json
  def show
    @parametro = Cirugia.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /cirugias/new
  def new
    @parametro = Cirugia.new
    @collection = TipoCirugia.where(:estatus => 1)
    @referencia = :tipo_cirugia_id

    render "parametros_select/new"
  end

  # GET /cirugias/1/edit
  def edit
    @parametro = Cirugia.find(params[:id])
    @collection = TipoCirugia.where(:estatus => 1)
    @referencia = :tipo_cirugia_id

    render "parametros_select/edit"
  end

  # POST /cirugias
  # POST /cirugias.json
  def create
    @cirugia = Cirugia.new(cirugia_params)

    respond_to do |format|
      if @cirugia.save
        format.html { redirect_to cirugias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @cirugia }
      else
        format.html { render :new }
        format.json { render json: @cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cirugias/1
  # PATCH/PUT /cirugias/1.json
  def update
    respond_to do |format|
      if @cirugia.update(cirugia_params)
        format.html { redirect_to cirugias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @cirugia }
      else
        format.html { render :edit }
        format.json { render json: @cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cirugias/1
  # DELETE /cirugias/1.json
  def destroy
    @cirugia.estatus = 2
    @cirugia.save
    respond_to do |format|
      format.html { redirect_to cirugias_url, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cirugia
      @cirugia = Cirugia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cirugia_params
      params.require(:cirugia).permit(:descripcion, :estatus, :tipo_cirugia_id)
    end
end
