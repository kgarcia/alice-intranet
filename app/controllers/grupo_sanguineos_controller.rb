class GrupoSanguineosController < ApplicationController
  before_action :set_grupo_sanguineo, only: [:show, :edit, :update, :destroy]

  # GET /grupo_sanguineos
  # GET /grupo_sanguineos.json
  def index
    @parametros = GrupoSanguineo.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /grupo_sanguineos/1
  # GET /grupo_sanguineos/1.json
  def show
    @parametro = GrupoSanguineo.find(params[:id])

    render "parametros/edit"
  end

  # GET /grupo_sanguineos/new
  def new
    @parametro = GrupoSanguineo.new
    render "parametros/new"
  end

  # GET /grupo_sanguineos/1/edit
  def edit
    @parametro = GrupoSanguineo.find(params[:id])

    render "parametros/edit"
  end

  # POST /grupo_sanguineos
  # POST /grupo_sanguineos.json
  def create
    @grupo_sanguineo = GrupoSanguineo.new(grupo_sanguineo_params)

    respond_to do |format|
      if @grupo_sanguineo.save
        format.html { redirect_to grupo_sanguineos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @grupo_sanguineo }
      else
        format.html { render :new }
        format.json { render json: @grupo_sanguineo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupo_sanguineos/1
  # PATCH/PUT /grupo_sanguineos/1.json
  def update
    respond_to do |format|
      if @grupo_sanguineo.update(grupo_sanguineo_params)
        format.html { redirect_to grupo_sanguineos_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @grupo_sanguineo }
      else
        format.html { render :edit }
        format.json { render json: @grupo_sanguineo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupo_sanguineos/1
  # DELETE /grupo_sanguineos/1.json
  def destroy
    @grupo_sanguineo.estatus = 2
    @grupo_sanguineo.save
    respond_to do |format|
      format.html { redirect_to grupo_sanguineos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo_sanguineo
      @grupo_sanguineo = GrupoSanguineo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_sanguineo_params
      params.require(:grupo_sanguineo).permit(:descripcion, :estatus)
    end
end
