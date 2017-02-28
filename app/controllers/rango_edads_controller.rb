class RangoEdadsController < ApplicationController
  before_action :set_rango_edad, only: [:show, :edit, :update, :destroy]

  # GET /rango_edads
  # GET /rango_edads.json
  def index
    @rango_edads = RangoEdad.all
  end

  # GET /rango_edads/1
  # GET /rango_edads/1.json
  def show
  end

  # GET /rango_edads/new
  def new
    @rango_edad = RangoEdad.new
  end

  # GET /rango_edads/1/edit
  def edit
  end

  # POST /rango_edads
  # POST /rango_edads.json
  def create
    @rango_edad = RangoEdad.new(rango_edad_params)

    respond_to do |format|
      if @rango_edad.save
        format.html { redirect_to @rango_edad, notice: 'Rango edad was successfully created.' }
        format.json { render :show, status: :created, location: @rango_edad }
      else
        format.html { render :new }
        format.json { render json: @rango_edad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rango_edads/1
  # PATCH/PUT /rango_edads/1.json
  def update
    respond_to do |format|
      if @rango_edad.update(rango_edad_params)
        format.html { redirect_to @rango_edad, notice: 'Rango edad was successfully updated.' }
        format.json { render :show, status: :ok, location: @rango_edad }
      else
        format.html { render :edit }
        format.json { render json: @rango_edad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rango_edads/1
  # DELETE /rango_edads/1.json
  def destroy
    @rango_edad.destroy
    respond_to do |format|
      format.html { redirect_to rango_edads_url, notice: 'Rango edad was successfully destroyed.' }
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
