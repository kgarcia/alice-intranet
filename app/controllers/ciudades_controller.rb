class CiudadesController < ApplicationController
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]

  # GET /ciudades
  # GET /ciudades.json
  def index
    @tipo = Estado.titulo
    @parametros = Ciudad.where(:estatus => 1)
    respond_to do |format|
      format.html { render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /ciudades/1
  # GET /ciudades/1.json
  def show
    @parametro = Ciudad.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /ciudades/new
  def new
    @parametro = Ciudad.new
    @collection = Estado.where(:estatus => 1)
    @referencia = :estado_id

    render "parametros_select/new"
  end

  # GET /ciudades/1/edit
  def edit
    @parametro = Ciudad.find(params[:id])
    @collection = Estado.where(:estatus => 1)
    @referencia = :estado_id
    render "parametros_select/edit"
  end

  # POST /ciudades
  # POST /ciudades.json
  def create
    @ciudad = Ciudad.new(ciudad_params)

    respond_to do |format|
      if @ciudad.save
        format.html { redirect_to ciudades_path, notice: 'El registro ha sido creado exitosamente. ' }
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
        format.html { redirect_to ciudades_path, info: 'El registro ha sido actualizado exitosamente. ' }
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
    @ciudad.estatus = 2
    @ciudad.save
    respond_to do |format|
      format.html { redirect_to ciudades_url, alert: 'El registro ha sido eliminado exitosamente.' }
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
