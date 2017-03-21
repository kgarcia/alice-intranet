class RangoPesosController < ApplicationController
  before_action :set_rango_peso, only: [:show, :edit, :update, :destroy]

  # GET /rango_pesos
  # GET /rango_pesos.json
  def index
    @rango_pesos = RangoPeso.where(:estatus => 1)
  end

  # GET /rango_pesos/1
  # GET /rango_pesos/1.json
  def show
  end

  # GET /rango_pesos/new
  def new
    @rango_peso = RangoPeso.new
  end

  # GET /rango_pesos/1/edit
  def edit
  end

  # POST /rango_pesos
  # POST /rango_pesos.json
  def create
    @rango_peso = RangoPeso.new(rango_peso_params)

    respond_to do |format|
      if @rango_peso.save
        format.html { redirect_to rango_pesos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @rango_peso }
      else
        format.html { render :new }
        format.json { render json: @rango_peso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rango_pesos/1
  # PATCH/PUT /rango_pesos/1.json
  def update
    respond_to do |format|
      if @rango_peso.update(rango_peso_params)
        format.html { redirect_to rango_pesos_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @rango_peso }
      else
        format.html { render :edit }
        format.json { render json: @rango_peso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rango_pesos/1
  # DELETE /rango_pesos/1.json
  def destroy
    @rango_peso.estatus = 2
    @rango_peso.save
    respond_to do |format|
      format.html { redirect_to rango_pesos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rango_peso
      @rango_peso = RangoPeso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rango_peso_params
      params.require(:rango_peso).permit(:descripcion, :peso_inicial, :peso_final, :estatus)
    end
end
