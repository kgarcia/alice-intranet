class ReferenciasController < ApplicationController
  before_action :set_referencia, only: [:show, :edit, :update, :destroy]

  # GET /referencias
  # GET /referencias.json
  def index
    @parametros = Referencia.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /referencias/1
  # GET /referencias/1.json
  def show
    @parametro = Referencia.find(params[:id])

    render "parametros/show"
  end

  # GET /tipo_preguntaes/new
  def new
    @parametro = Referencia.new

    render "parametros/new"
  end

  # GET /tipo_preguntaes/1/edit
  def edit
    @parametro = Referencia.find(params[:id])

    render "parametros/edit"
  end

  # POST /referencias
  # POST /referencias.json
  def create
    @referencia = Referencia.new(referencia_params)

    respond_to do |format|
      if @referencia.save
        format.html { redirect_to referencias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @referencia }
      else
        format.html { render :new }
        format.json { render json: @referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referencias/1
  # PATCH/PUT /referencias/1.json
  def update
    respond_to do |format|
      if @referencia.update(referencia_params)
        format.html { redirect_to referencias_path, notice: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @referencia }
      else
        format.html { render :edit }
        format.json { render json: @referencia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referencias/1
  # DELETE /referencias/1.json
  def destroy
    @referencia.estatus = 2
    @referencia.save
    respond_to do |format|
      format.html { redirect_to referencias_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referencia
      @referencia = Referencia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referencia_params
      params.require(:referencia).permit(:descripcion, :estatus)
    end
end
