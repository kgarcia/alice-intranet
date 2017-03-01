class TipoDifusionesController < ApplicationController
  before_action :set_tipo_difusion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_difusiones
  # GET /tipo_difusiones.json
  def index
    @tipo_difusiones = TipoDifusion.all
  end

  # GET /tipo_difusiones/1
  # GET /tipo_difusiones/1.json
  def show
  end

  # GET /tipo_difusiones/new
  def new
    @tipo_difusion = TipoDifusion.new
  end

  # GET /tipo_difusiones/1/edit
  def edit
  end

  # POST /tipo_difusiones
  # POST /tipo_difusiones.json
  def create
    @tipo_difusion = TipoDifusion.new(tipo_difusion_params)

    respond_to do |format|
      if @tipo_difusion.save
        format.html { redirect_to @tipo_difusion, notice: 'Tipo difusion was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_difusion }
      else
        format.html { render :new }
        format.json { render json: @tipo_difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_difusiones/1
  # PATCH/PUT /tipo_difusiones/1.json
  def update
    respond_to do |format|
      if @tipo_difusion.update(tipo_difusion_params)
        format.html { redirect_to @tipo_difusion, notice: 'Tipo difusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_difusion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_difusiones/1
  # DELETE /tipo_difusiones/1.json
  def destroy
    @tipo_difusion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_difusiones_url, notice: 'Tipo difusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_difusion
      @tipo_difusion = TipoDifusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_difusion_params
      params.require(:tipo_difusion).permit(:descripcion, :estatus)
    end
end
