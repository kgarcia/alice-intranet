class InformacionGeneralsController < ApplicationController
  before_action :set_informacion_general, only: [:show, :edit, :update, :destroy]

  # GET /informacion_generals
  # GET /informacion_generals.json
  def index
    @informacion_general = InformacionGeneral.find_or_create_by(id: 1)
    
    respond_to do |format|
      format.html {  render "edit" }
      format.json { render json: @informacion_general }
    end
    
  end

  # GET /informacion_generals/1
  # GET /informacion_generals/1.json
  def show
  end

  # GET /informacion_generals/new
  def new
    @informacion_general = InformacionGeneral.new
   
  end

  # GET /informacion_generals/1/edit
  def edit
  end

  # POST /informacion_generals
  # POST /informacion_generals.json
  def create
    @informacion_general = InformacionGeneral.new(informacion_general_params)

    respond_to do |format|
      if @informacion_general.save
        format.html { redirect_to @informacion_general, notice: 'Informacion general was successfully created.' }
        format.json { render :show, status: :created, location: @informacion_general }
      else
        format.html { render :new }
        format.json { render json: @informacion_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /informacion_generals/1
  # PATCH/PUT /informacion_generals/1.json
  def update
    respond_to do |format|
      if @informacion_general.update(informacion_general_params)
        format.html { redirect_to @informacion_general, notice: 'Informacion general was successfully updated.' }
        format.json { render :show, status: :ok, location: @informacion_general }
      else
        format.html { render :edit }
        format.json { render json: @informacion_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /informacion_generals/1
  # DELETE /informacion_generals/1.json
  def destroy
    @informacion_general.estatus = 2
    @informacion_general.save
    respond_to do |format|
      format.html { redirect_to informacion_generals_url, notice: 'Informacion general was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informacion_general
      @informacion_general = InformacionGeneral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def informacion_general_params
      params.require(:informacion_general).permit(:nombre, :rif, :direccion, :tlf, :email, :widgetFB, :widgetTW, :slogan, :logo, :latitud, :longitud)
    end
end
