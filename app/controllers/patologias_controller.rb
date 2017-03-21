class PatologiasController < ApplicationController
  before_action :set_patologia, only: [:show, :edit, :update, :destroy]

  # GET /patologias
  # GET /patologias.json
  def index
    @tipo = TipoPatologia.titulo
    @parametros = Patologia.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /patologias/1
  # GET /patologias/1.json
  def show
    @parametro = Patologia.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /patologias/new
  def new
    @parametro = Patologia.new
    @collection = TipoPatologia.where(:estatus => 1)
    @referencia = :tipo_patologia_id

    render "parametros_select/new"
  end

  # GET /patologias/1/edit
  def edit
    @parametro = Patologia.find(params[:id])
    @collection = TipoPatologia.where(:estatus => 1)
    @referencia = :tipo_patologia_id

    render "parametros_select/edit"
  end

  # POST /patologias
  # POST /patologias.json
  def create
    @patologia = Patologia.new(patologia_params)

    respond_to do |format|
      if @patologia.save
        format.html { redirect_to patologias_path, notice: 'El registro ha sido creado exitosamente.  ' }
        format.json { render :show, status: :created, location: @patologia }
      else
        format.html { render :new }
        format.json { render json: @patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patologias/1
  # PATCH/PUT /patologias/1.json
  def update
    respond_to do |format|
      if @patologia.update(patologia_params)
        format.html { redirect_to patologias_path, notice: 'El registro ha sido actualizados exitosamente.' }
        format.json { render :show, status: :ok, location: @patologia }
      else
        format.html { render :edit }
        format.json { render json: @patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patologias/1
  # DELETE /patologias/1.json
  def destroy
    @patologia.estatus = 2
    @patologia.save
    respond_to do |format|
      format.html { redirect_to patologias_path, notice: 'El registro ha sido eliminados exitosamente.  ' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patologia
      @patologia = Patologia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patologia_params
      params.require(:patologia).permit(:descripcion, :estatus, :tipo_patologia_id)
    end
end
