class LesionesController < ApplicationController
  before_action :set_lesion, only: [:show, :edit, :update, :destroy]

  # GET /lesiones
  # GET /lesiones.json
  def index
    @tipo = TipoLesion.titulo
    @parametros = Lesion.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /lesiones/1
  # GET /lesiones/1.json
  def show
    @parametro = Lesion.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /lesiones/new
  def new
    @parametro = Lesion.new
    @collection = TipoLesion.where(:estatus => 1)
    @referencia = :tipo_lesion_id

    render "parametros_select/new"
  end

  # GET /lesiones/1/edit
  def edit
    @parametro = Lesion.find(params[:id])
    @collection = TipoLesion.where(:estatus => 1)
    @referencia = :tipo_lesion_id

    render "parametros_select/edit"
  end

  # POST /lesiones
  # POST /lesiones.json
  def create
    @lesion = Lesion.new(lesion_params)

    respond_to do |format|
      if @lesion.save
        format.html { redirect_to lesiones_path, notice: 'El registro ha sido creado exitosamente. ' }
        format.json { render :show, status: :created, location: @lesion }
      else
        format.html { render :new }
        format.json { render json: @lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesiones/1
  # PATCH/PUT /lesiones/1.json
  def update
    respond_to do |format|
      if @lesion.update(lesion_params)
        format.html { redirect_to lesiones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @lesion }
      else
        format.html { render :edit }
        format.json { render json: @lesion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesiones/1
  # DELETE /lesiones/1.json
  def destroy
    @lesion.estatus = 2
    @lesion.save
    respond_to do |format|
      format.html { redirect_to lesiones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesion
      @lesion = Lesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesion_params
      params.require(:lesion).permit(:descripcion, :estatus, :tipo_lesion_id)
    end
end
