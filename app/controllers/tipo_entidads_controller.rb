class TipoEntidadsController < ApplicationController
  before_action :set_tipo_entidad, only: [:show, :edit, :update, :destroy]

  # GET /tipo_entidads
  # GET /tipo_entidads.json
  def index
    @tipo_entidads = TipoEntidad.all
  end

  # GET /tipo_entidads/1
  # GET /tipo_entidads/1.json
  def show
  end

  # GET /tipo_entidads/new
  def new
    @tipo_entidad = TipoEntidad.new
  end

  # GET /tipo_entidads/1/edit
  def edit
  end

  # POST /tipo_entidads
  # POST /tipo_entidads.json
  def create
    @tipo_entidad = TipoEntidad.new(tipo_entidad_params)

    respond_to do |format|
      if @tipo_entidad.save
        format.html { redirect_to @tipo_entidad, notice: 'Tipo entidad was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_entidad }
      else
        format.html { render :new }
        format.json { render json: @tipo_entidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_entidads/1
  # PATCH/PUT /tipo_entidads/1.json
  def update
    respond_to do |format|
      if @tipo_entidad.update(tipo_entidad_params)
        format.html { redirect_to @tipo_entidad, notice: 'Tipo entidad was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_entidad }
      else
        format.html { render :edit }
        format.json { render json: @tipo_entidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_entidads/1
  # DELETE /tipo_entidads/1.json
  def destroy
    @tipo_entidad.destroy
    respond_to do |format|
      format.html { redirect_to tipo_entidads_url, notice: 'Tipo entidad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_entidad
      @tipo_entidad = TipoEntidad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_entidad_params
      params.require(:tipo_entidad).permit(:descripcion, :estatus)
    end
end
