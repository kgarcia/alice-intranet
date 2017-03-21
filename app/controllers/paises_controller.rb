class PaisesController < ApplicationController
  before_action :set_pais, only: [:show, :edit, :update, :destroy]

  # GET /paises
  # GET /paises.json
  def index
    @parametros = Pais.where(:estatus => 1)
    @paises = Pais.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end

  end

  # GET /paises/1
  # GET /paises/1.json
  def show
   @parametro = Pais.find(1)
    puts '##########################################'
    puts @parametro.to_json
    puts '##########################################'
   # render "parametros/edit"
   respond_to do |format|
      
      format.json { render json: @parametro.to_json }
    end
  end

  # GET /paises/new
  def new
    @parametro = Pais.new

    render "parametros/new"
  end

  # GET /paises/1/edit
  def edit
    @parametro = Pais.find(params[:id])

    render "parametros/edit"
  end

  # POST /paises
  # POST /paises.json
  def create
    @pais = Pais.new(pais_params)

    respond_to do |format|
      if @pais.save
        format.html { redirect_to paises_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @pais }
      else
        format.html { render :new }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paises/1
  # PATCH/PUT /paises/1.json
  def update
    respond_to do |format|
      if @pais.update(pais_params)
        format.html { redirect_to paises_path, info: 'El registro ha sido actualizado exitosamente. ' }
        format.json { render :show, status: :ok, location: @pais }
      else
        format.html { render :edit }
        format.json { render json: @pais.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paises/1
  # DELETE /paises/1.json
  def destroy
    @pais.estatus = 2
    @pais.save
    respond_to do |format|
      format.html { redirect_to paises_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pais
      @pais = Pais.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pais_params
      params.require(:pais).permit(:descripcion, :estatus)
    end
end
