class CiudadesController < ApplicationController
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
  def index
<<<<<<< HEAD
    @ciudades = Ciudad.all
=======
    @parametros = Ciudad.all
    render "parametros_select/index"  
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
<<<<<<< HEAD
=======
    @parametro = Ciudad.find(params[:id])

    render "parametros_select/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /ciudades/new
  def new
<<<<<<< HEAD
    @ciudad = Ciudad.new
=======
    @parametro = Ciudad.new
    @collection = Estado.all
    @referencia = :estado_id

    render "parametros_select/new"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /ciudades/1/edit
  def edit
<<<<<<< HEAD
=======
    @parametro = Ciudad.find(params[:id])

    render "parametros_select/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudad = Ciudad.new(ciudad_params)

    respond_to do |format|
      if @ciudad.save
<<<<<<< HEAD
        format.html { redirect_to @ciudad, notice: 'Ciudad was successfully created.' }
=======
        format.html { redirect_to edit_ciudad_path(@ciudad), notice: 'Ciudad was successfully created.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :created, location: @ciudad }
      else
        format.html { render :new }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciudades/1
  # PATCH/PUT /ciudades/1.json
  def update
    respond_to do |format|
      if @ciudad.update(ciudad_params)
<<<<<<< HEAD
        format.html { redirect_to @ciudad, notice: 'Ciudad was successfully updated.' }
=======
        format.html { redirect_to edit_ciudad_path(@ciudad), notice: 'Ciudad was successfully updated.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :ok, location: @ciudad }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudades/1
  # DELETE /ciudades/1.json
  def destroy
    @ciudad.destroy
    respond_to do |format|
      format.html { redirect_to ciudades_url, notice: 'Ciudad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad
      @ciudad = Ciudad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      params.require(:ciudad).permit(:descripcion, :estatus, :estado_id)
    end
end
