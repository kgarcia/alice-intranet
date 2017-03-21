class RangoEdadesController < ApplicationController
  before_action :set_rango_edad, only: [:show, :edit, :update, :destroy]

  # GET /rango_edades
  # GET /rango_edades.json
  def index
    @rango_edades = RangoEdad.where(:estatus => 1)
  end

  # GET /rango_edades/1
  # GET /rango_edades/1.json
  def show
  end

  # GET /rango_edades/new
  def new
    @rango_edad = RangoEdad.new
  end

  # GET /rango_edades/1/edit
  def edit
  end

  # POST /rango_edades
  # POST /rango_edades.json
  def create
    @rango_edad = RangoEdad.new(rango_edad_params)

    respond_to do |format|
      if @rango_edad.save
        format.html { redirect_to rango_edades_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @rango_edad }
      else
        format.html { render :new }
        format.json { render json: @rango_edad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rango_edades/1
  # PATCH/PUT /rango_edades/1.json
  def update
    respond_to do |format|
      if @rango_edad.update(rango_edad_params)
        format.html { redirect_to rango_edades_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @rango_edad }
      else
        format.html { render :edit }
        format.json { render json: @rango_edad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rango_edades/1
  # DELETE /rango_edades/1.json
  def destroy
    @rango_edad.estatus = 2
    @rango_edad.save
    respond_to do |format|
      format.html { redirect_to rango_edades_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rango_edad
      @rango_edad = RangoEdad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rango_edad_params
      params.require(:rango_edad).permit(:descripcion, :edad_inicial, :edad_final, :estatus)
    end
end
