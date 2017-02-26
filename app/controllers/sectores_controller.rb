class SectoresController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :update, :destroy]

  # GET /sectores
  # GET /sectores.json
  def index
<<<<<<< HEAD
    @sectores = Sector.all
=======
    @parametros = Sector.all

    render "parametros/index"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /sectores/1
  # GET /sectores/1.json
  def show
<<<<<<< HEAD
=======
    @parametro = Sector.find(params[:id])

    render "parametros/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /sectores/new
  def new
<<<<<<< HEAD
    @sector = Sector.new
=======
    @parametro = Sector.new
    render "parametros/new"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /sectores/1/edit
  def edit
<<<<<<< HEAD
=======
    @parametro = Sector.find(params[:id])

    render "parametros/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # POST /sectores
  # POST /sectores.json
  def create
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
<<<<<<< HEAD
        format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
=======
        format.html { redirect_to edit_sector_path(@sector), notice: 'Sector was successfully created.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :created, location: @sector }
      else
        format.html { render :new }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sectores/1
  # PATCH/PUT /sectores/1.json
  def update
    respond_to do |format|
      if @sector.update(sector_params)
<<<<<<< HEAD
        format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
=======
        format.html { redirect_to edit_sector_path(@sector), notice: 'Sector was successfully updated.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :ok, location: @sector }
      else
        format.html { render :edit }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sectores/1
  # DELETE /sectores/1.json
  def destroy
    @sector.destroy
    respond_to do |format|
      format.html { redirect_to sectores_url, notice: 'Sector was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sector_params
      params.require(:sector).permit(:descripcion, :estatus)
    end
end
