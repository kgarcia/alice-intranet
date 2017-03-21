class DiasController < ApplicationController
  before_action :set_dia, only: [:show, :edit, :update, :destroy]

  # GET /dias
  # GET /dias.json
  def index
    @parametros = Dia.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /dias/1
  # GET /dias/1.json
  def show
     @parametro = Dia.find(params[:id])

    render "parametros/edit"
  end

  # GET /dias/new
  def new
      @parametro = Dia.new

      render "parametros/new"
  end

  # GET /dias/1/edit
  def edit
    @parametro = Dia.find(params[:id])

    render "parametros/edit"
  end

  # POST /dias
  # POST /dias.json
  def create
    @dia = Dia.new(dia_params)

    respond_to do |format|
      if @dia.save
        format.html { redirect_to dias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @dia }
      else
        format.html { render :new }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dias/1
  # PATCH/PUT /dias/1.json
  def update
    respond_to do |format|
      if @dia.update(dia_params)
        format.html { redirect_to dias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @dia }
      else
        format.html { render :edit }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dias/1
  # DELETE /dias/1.json
  def destroy
    @dia.estatus = 2
    @dia.save
    respond_to do |format|
      format.html { redirect_to dias_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dia
      @dia = Dia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dia_params
      params.require(:dia).permit(:descripcion, :estatus)
    end
end
