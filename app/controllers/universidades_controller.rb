class UniversidadesController < ApplicationController
  before_action :set_universidad, only: [:show, :edit, :update, :destroy]

  # GET /universidades
  # GET /universidades.json
  def index
    @parametros = Universidad.where(:estatus => 1)
    respond_to do |format|
      format.html { render "parametros/index" }
      format.json { render :index, location: @universidades }
    end
  end

  # GET /universidades/1
  # GET /universidades/1.json
  def show
    @parametro = Universidad.find(params[:id])

    render "parametros/edit"
  end

  # GET /universidades/new
  def new
    @parametro = Universidad.new
    render "parametros/new"
  end

  # GET /universidades/1/edit
  def edit
    @parametro = Universidad.find(params[:id])

    render "parametros/edit"
  end

  # POST /universidades
  # POST /universidades.json
  def create
    @universidad = Universidad.new(universidad_params)

    respond_to do |format|
      if @universidad.save
        format.html { redirect_to universidades_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @universidad }
      else
        format.html { render :new }
        format.json { render json: @universidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /universidades/1
  # PATCH/PUT /universidades/1.json
  def update
    respond_to do |format|
      if @universidad.update(universidad_params)
        format.html { redirect_to universidades_path, notice: 'El registro ha sido creado exitosamente.'}
        format.json { render :show, status: :ok, location: @universidad }
      else
        format.html { render :edit }
        format.json { render json: @universidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /universidades/1
  # DELETE /universidades/1.json
  def destroy
    @universidad.estatus = 2
    @universidad.save
    respond_to do |format|
      format.html { redirect_to universidades_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_universidad
      @universidad = Universidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def universidad_params
      params.require(:universidad).permit(:descripcion, :estatus)
    end
end
