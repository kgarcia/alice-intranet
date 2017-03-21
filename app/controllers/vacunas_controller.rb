class VacunasController < ApplicationController
  before_action :set_vacuna, only: [:show, :edit, :update, :destroy]

  # GET /vacunas
  # GET /vacunas.json
  def index
    @parametros = Vacuna.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /vacunas/1
  # GET /vacunas/1.json
  def show
    @parametro = Vacuna.find(params[:id])

    render "parametros/edit"
  end

  # GET /vacunas/new
  def new
    @parametro = Vacuna.new
    render "parametros/new"
  end

  # GET /vacunas/1/edit
  def edit
    @parametro = Vacuna.find(params[:id])

    render "parametros/edit"
  end

  # POST /vacunas
  # POST /vacunas.json
  def create
    @vacuna = Vacuna.new(vacuna_params)

    respond_to do |format|
      if @vacuna.save
        format.html { redirect_to vacunas_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @vacuna }
      else
        format.html { render :new }
        format.json { render json: @vacuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacunas/1
  # PATCH/PUT /vacunas/1.json
  def update
    respond_to do |format|
      if @vacuna.update(vacuna_params)
        format.html { redirect_to vacunas_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @vacuna }
      else
        format.html { render :edit }
        format.json { render json: @vacuna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacunas/1
  # DELETE /vacunas/1.json
  def destroy
    @vacuna.estatus = 2
    @vacuna.save
    respond_to do |format|
      format.html { redirect_to vacunas_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacuna
      @vacuna = Vacuna.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacuna_params
      params.require(:vacuna).permit(:descripcion, :estatus)
    end
end
