class EstadoCivilesController < ApplicationController
  before_action :set_estado_civil, only: [:show, :edit, :update, :destroy]

  # GET /estado_civiles
  # GET /estado_civiles.json
  def index
    @parametros = EstadoCivil.where(:estatus => 1)

    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /estado_civiles/1
  # GET /estado_civiles/1.json
  def show
    @parametro = EstadoCivil.find(params[:id])

    render "parametros/edit"
  end

  # GET /estado_civiles/new
  def new
    @parametro = EstadoCivil.new
    render "parametros/new"
  end

  # GET /estado_civiles/1/edit
  def edit
    @parametro = EstadoCivil.find(params[:id])

    render "parametros/edit"
  end

  # POST /estado_civiles
  # POST /estado_civiles.json
  def create
    @estado_civil = EstadoCivil.new(estado_civil_params)

    respond_to do |format|
      if @estado_civil.save
        format.html { redirect_to estado_civiles_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @estado_civil }
      else
        format.html { render :new }
        format.json { render json: @estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_civiles/1
  # PATCH/PUT /estado_civiles/1.json
  def update
    respond_to do |format|
      if @estado_civil.update(estado_civil_params)
        format.html { redirect_to estado_civiles_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @estado_civil }
      else
        format.html { render :edit }
        format.json { render json: @estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_civiles/1
  # DELETE /estado_civiles/1.json
  def destroy
    @estado_civil.estatus = 2
    @estado_civil.save
    respond_to do |format|
      format.html { redirect_to estado_civiles_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_civil
      @estado_civil = EstadoCivil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_civil_params
      params.require(:estado_civil).permit(:descripcion, :estatus)
    end
end
