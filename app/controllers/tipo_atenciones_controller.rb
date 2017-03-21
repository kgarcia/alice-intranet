class TipoAtencionesController < ApplicationController
  before_action :set_tipo_atencion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_atenciones
  # GET /tipo_atenciones.json
  def index
    @parametros = TipoAtencion.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_atenciones/1
  # GET /tipo_atenciones/1.json
  def show
    @parametro = TipoAtencion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_atenciones/new
  def new
    @parametro = TipoAtencion.new

    render "parametros/new"
  end

  # GET /tipo_atenciones/1/edit
  def edit
    @parametro = TipoAtencion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_atenciones
  # POST /tipo_atenciones.json
  def create
    @tipo_atencion = TipoAtencion.new(tipo_atencion_params)

    respond_to do |format|
      if @tipo_atencion.save
        format.html { redirect_to tipo_atenciones_path, notice: 'El registro ha sido creado exitosamente.'}
        format.json { render :show, status: :created, location: @tipo_atencion }
      else
        format.html { render :new }
        format.json { render json: @tipo_atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_atenciones/1
  # PATCH/PUT /tipo_atenciones/1.json
  def update
    respond_to do |format|
      if @tipo_atencion.update(tipo_atencion_params)
        format.html { redirect_to tipo_atenciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_atencion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_atencion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_atenciones/1
  # DELETE /tipo_atenciones/1.json
  def destroy
    @tipo_atencion.estatus = 2
    @tipo_atencion.save
    respond_to do |format|
      format.html { redirect_to tipo_atenciones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_atencion
      @tipo_atencion = TipoAtencion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_atencion_params
      params.require(:tipo_atencion).permit(:descripcion, :estatus)
    end
end
