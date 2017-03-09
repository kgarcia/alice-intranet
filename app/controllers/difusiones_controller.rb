class DifusionesController < ApplicationController
  before_action :set_difusion, only: [:show, :edit, :update, :destroy]

  # GET /difusiones
  # GET /difusiones.json
  def index
    @difusiones = Difusion.all
  end

  # GET /difusiones/1
  # GET /difusiones/1.json
  def show
  end

  # GET /difusiones/new
  def new
    @difusion = Difusion.new
    @tipo_entidades = TipoEntidad.all
    @tipo_difusiones = TipoDifusion.all
    @entidades = Servicio.all
    @medios = MedioDifusion.all
  end

  # GET /difusiones/1/edit
  def edit
    @tipo_entidades = TipoEntidad.all
    @tipo_difusiones = TipoDifusion.all
    @entidades = Servicio.all
    @medios = MedioDifusion.all
  end

  # POST /difusiones
  # POST /difusiones.json
  def create
    @difusion = Difusion.new(difusion_params)
    @difusion.difusionesMedioDifusion = params[:medios]
    respond_to do |format|
      if @difusion.save
        format.html { redirect_to @difusion, notice: 'Difusion was successfully created.' }
        format.json { render :show, status: :created, location: @difusion }
      else
        format.html { render :new }
        format.json { render json: @difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /difusiones/1
  # PATCH/PUT /difusiones/1.json
  def update
    @difusion.difusionesMedioDifusion = params[:medios]
    respond_to do |format|
      if @difusion.update(difusion_params)
        format.html { redirect_to @difusion, notice: 'Difusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @difusion }
      else
        format.html { render :edit }
        format.json { render json: @difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /difusiones/1
  # DELETE /difusiones/1.json
  def destroy
    @difusion.destroy
    respond_to do |format|
      format.html { redirect_to difusiones_url, notice: 'Difusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_difusion
      @difusion = Difusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def difusion_params
      params.require(:difusion).permit(:asunto, :texto, :imagen, :tipo_entidad_id, :entidad_id, :token_facebook, :tipo_difusion_id, :estatus)
    end
end
