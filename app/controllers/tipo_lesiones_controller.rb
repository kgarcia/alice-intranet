class TipoLesionesController < ApplicationController
  before_action :set_tipo_lesion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_lesiones
  # GET /tipo_lesiones.json
  def index
    @parametros = TipoLesion.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_lesiones/1
  # GET /tipo_lesiones/1.json
  def show
    @parametro = TipoLesion.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_lesiones/new
  def new
    @parametro = TipoLesion.new
    render "parametros/new"
  end

  # GET /tipo_lesiones/1/edit
  def edit
    @parametro = TipoLesion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_lesiones
  # POST /tipo_lesiones.json
  def create
    @tipo_lesion = TipoLesion.new(tipo_lesion_params)

    respond_to do |format|
      if @tipo_lesion.save
        format.html { redirect_to tipo_lesiones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_lesion }
      else
        format.html { render :new }
        format.json { render json: @tipo_lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_lesiones/1
  # PATCH/PUT /tipo_lesiones/1.json
  def update
    respond_to do |format|
      if @tipo_lesion.update(tipo_lesion_params)
        format.html { redirect_to tipo_lesiones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_lesion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_lesiones/1
  # DELETE /tipo_lesiones/1.json
  def destroy
    @tipo_lesion.estatus = 2
    @tipo_lesion.save
    respond_to do |format|
      format.html { redirect_to tipo_lesiones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_lesion
      @tipo_lesion = TipoLesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_lesion_params
      params.require(:tipo_lesion).permit(:descripcion, :estatus)
    end
end
