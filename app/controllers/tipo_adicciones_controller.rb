class TipoAdiccionesController < ApplicationController
  before_action :set_tipo_adiccion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_adicciones
  # GET /tipo_adicciones.json
  def index
    @parametros = TipoAdiccion.where(:estatus => 1)
        
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_adicciones/1
  # GET /tipo_adicciones/1.json
  def show
    @parametro = TipoAdiccion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_adicciones/new
  def new
    @parametro = TipoAdiccion.new
    render "parametros/new"
  end

  # GET /tipo_adicciones/1/edit
  def edit
    @parametro = TipoAdiccion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_adicciones
  # POST /tipo_adicciones.json
  def create
    @tipo_adiccion = TipoAdiccion.new(tipo_adiccion_params)

    respond_to do |format|
      if @tipo_adiccion.save
        format.html { redirect_to tipo_adicciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_adiccion }
      else
        format.html { render :new }
        format.json { render json: @tipo_adiccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_adicciones/1
  # PATCH/PUT /tipo_adicciones/1.json
  def update
    respond_to do |format|
      if @tipo_adiccion.update(tipo_adiccion_params)
        format.html { redirect_to tipo_adicciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_adiccion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_adiccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_adicciones/1
  # DELETE /tipo_adicciones/1.json
  def destroy
    @tipo_adiccion.estatus = 2
    @tipo_adiccion.save
    respond_to do |format|
      format.html { redirect_to tipo_adicciones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_adiccion
      @tipo_adiccion = TipoAdiccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_adiccion_params
      params.require(:tipo_adiccion).permit(:descripcion, :estatus)
    end
end
