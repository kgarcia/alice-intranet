class SectoresController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  # GET /sectores
  # GET /sectores.json
  def index
    @parametros = Sector.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /sectores/1
  # GET /sectores/1.json
  def show
    @parametro = Sector.find(params[:id])

    render "parametros/edit"
  end

  # GET /sectores/new
  def new
    @parametro = Sector.new
    render "parametros/new"
  end

  # GET /sectores/1/edit
  def edit
    @parametro = Sector.find(params[:id])

    render "parametros/edit"
  end

  # POST /sectores
  # POST /sectores.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to sectores_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectores/1
  # PATCH/PUT /sectores/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to sectores_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectores/1
  # DELETE /sectores/1.json
  def destroy
    @sector.estatus = 2
    @sector.save
    respond_to do |format|
      format.html { redirect_to sectores_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_params
      params.require(:sector).permit(:descripcion, :estatus)
    end
end
