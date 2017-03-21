class MedioDifusionesController < ApplicationController
  before_action :set_medio_difusion, only: [:show, :edit, :update, :destroy]

  # GET /medio_difusiones
  # GET /medio_difusiones.json
  def index
    @parametros = MedioDifusion.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /medio_difusiones/1
  # GET /medio_difusiones/1.json
  def show
    @parametro = MedioDifusion.find(params[:id])

    render "parametros/edit"
  end

  # GET /medio_difusiones/new
  def new
    @parametro = MedioDifusion.new
    render "parametros/new"
  end

  # GET /medio_difusiones/1/edit
  def edit
    @parametro = MedioDifusion.find(params[:id])

    render "parametros/edit"
  end

  # POST /medio_difusiones
  # POST /medio_difusiones.json
  def create
    @medio_difusion = MedioDifusion.new(medio_difusion_params)

    respond_to do |format|
      if @medio_difusion.save
        format.html { redirect_to medio_difusiones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @medio_difusion }
      else
        format.html { render :new }
        format.json { render json: @medio_difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medio_difusiones/1
  # PATCH/PUT /medio_difusiones/1.json
  def update
    respond_to do |format|
      if @medio_difusion.update(medio_difusion_params)
        format.html { redirect_to medio_difusiones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @medio_difusion }
      else
        format.html { render :edit }
        format.json { render json: @medio_difusion.errors, status: :unprocessable_entity }
      end
    end
   end

  # DELETE /medio_difusiones/1
  # DELETE /medio_difusiones/1.json
  def destroy
    @medio_difusion.estatus = 2
    @medio_difusion.save
    respond_to do |format|
      format.html { redirect_to medio_difusiones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medio_difusion
      @medio_difusion = MedioDifusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medio_difusion_params
      params.require(:medio_difusion).permit(:descripcion, :estatus)
    end
end
