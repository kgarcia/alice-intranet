class AdiccionesController < ApplicationController
  before_action :set_adiccion, only: [:show, :edit, :update, :destroy]

  # GET /adicciones
  # GET /adicciones.json
  def index
    @tipo = TipoAdiccion.titulo
    @parametros = Adiccion.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /adicciones/1
  # GET /adicciones/1.json
  def show
    @parametro = Adiccion.find(params[:id])
    render "parametros_select/edit"
  end

  # GET /adicciones/new
  def new
    @parametro = Adiccion.new
    @collection = TipoAdiccion.where(:estatus => 1)
    @referencia = :tipo_adiccion_id
    render "parametros_select/new"
  end

  # GET /adicciones/1/edit
  def edit
    @parametro = Adiccion.find(params[:id])
    @collection = TipoAdiccion.where(:estatus => 1)
    @referencia = :tipo_adiccion_id

    render "parametros_select/edit"
  end

  # POST /adicciones
  # POST /adicciones.json
  def create
    @adiccion = Adiccion.new(adiccion_params)

    respond_to do |format|
      if @adiccion.save
        format.html { redirect_to adicciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @adiccion }
      else
        format.html { render :new }
        format.json { render json: @adiccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adicciones/1
  # PATCH/PUT /adicciones/1.json
  def update
    respond_to do |format|
      if @adiccion.update(adiccion_params)
        format.html { redirect_to adicciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @adiccion }
      else
        format.html { render :edit }
        format.json { render json: @adiccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adicciones/1
  # DELETE /adicciones/1.json
  def destroy
    @adiccion.estatus = 2
    @adiccion.save
    respond_to do |format|
      format.html { redirect_to adicciones_url, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adiccion
      @adiccion = Adiccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adiccion_params
      params.require(:adiccion).permit(:descripcion, :estatus, :tipo_adiccion_id)
    end
end
