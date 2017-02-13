class DiscapacidadesController < ApplicationController
  before_action :set_discapacidad, only: [:show, :edit, :update, :destroy]

  # GET /discapacidades
  # GET /discapacidades.json
  def index
    @discapacidades = Discapacidad.all
  end

  # GET /discapacidades/1
  # GET /discapacidades/1.json
  def show
  end

  # GET /discapacidades/new
  def new
    @discapacidad = Discapacidad.new
  end

  # GET /discapacidades/1/edit
  def edit
  end

  # POST /discapacidades
  # POST /discapacidades.json
  def create
    @discapacidad = Discapacidad.new(discapacidad_params)

    respond_to do |format|
      if @discapacidad.save
        format.html { redirect_to @discapacidad, notice: 'Discapacidad was successfully created.' }
        format.json { render :show, status: :created, location: @discapacidad }
      else
        format.html { render :new }
        format.json { render json: @discapacidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discapacidades/1
  # PATCH/PUT /discapacidades/1.json
  def update
    respond_to do |format|
      if @discapacidad.update(discapacidad_params)
        format.html { redirect_to @discapacidad, notice: 'Discapacidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @discapacidad }
      else
        format.html { render :edit }
        format.json { render json: @discapacidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discapacidades/1
  # DELETE /discapacidades/1.json
  def destroy
    @discapacidad.destroy
    respond_to do |format|
      format.html { redirect_to discapacidades_url, notice: 'Discapacidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discapacidad
      @discapacidad = Discapacidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discapacidad_params
      params.require(:discapacidad).permit(:descripcion, :estatus, :TipoDiscapacidad_id)
    end
end
