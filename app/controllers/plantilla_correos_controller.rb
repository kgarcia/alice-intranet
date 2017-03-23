class PlantillaCorreosController < ApplicationController
  before_action :set_plantilla_correo, only: [:show, :edit, :update, :destroy]

  # GET /plantilla_correos
  # GET /plantilla_correos.json
  def index
    @plantilla_correos = PlantillaCorreo.all
  end

  # GET /plantilla_correos/1
  # GET /plantilla_correos/1.json
  def show
  end

  # GET /plantilla_correos/new
  def new
    @plantilla_correo = PlantillaCorreo.new
  end

  # GET /plantilla_correos/1/edit
  def edit
  end

  # POST /plantilla_correos
  # POST /plantilla_correos.json
  def create
    @plantilla_correo = PlantillaCorreo.new(plantilla_correo_params)

    respond_to do |format|
      if @plantilla_correo.save
        format.html { redirect_to @plantilla_correo, notice: 'Plantilla correo was successfully created.' }
        format.json { render :show, status: :created, location: @plantilla_correo }
      else
        format.html { render :new }
        format.json { render json: @plantilla_correo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plantilla_correos/1
  # PATCH/PUT /plantilla_correos/1.json
  def update
    respond_to do |format|
      if @plantilla_correo.update(plantilla_correo_params)
        format.html { redirect_to plantilla_correos_url, notice: 'Plantilla correo was successfully updated.' }
        format.json { render :show, status: :ok, location: @plantilla_correo }
      else
        format.html { render :edit }
        format.json { render json: @plantilla_correo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plantilla_correos/1
  # DELETE /plantilla_correos/1.json
  def destroy
    @plantilla_correo.destroy
    respond_to do |format|
      format.html { redirect_to plantilla_correos_url, notice: 'Plantilla correo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantilla_correo
      @plantilla_correo = PlantillaCorreo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plantilla_correo_params
      params.require(:plantilla_correo).permit(:descripcion, :texto, :estatus)
    end
end
