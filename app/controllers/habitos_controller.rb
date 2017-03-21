class HabitosController < ApplicationController
  before_action :set_habito, only: [:show, :edit, :update, :destroy]

  # GET /habitos
  # GET /habitos.json
  def index
    @tipo = TipoHabito.titulo
    @parametros = Habito.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /habitos/1
  # GET /habitos/1.json
  def show
    @parametro = Habito.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /habitos/new
  def new
    @parametro = Habito.new
    @collection = TipoHabito.where(:estatus => 1)
    @referencia = :tipo_habito_id

    render "parametros_select/new"
  end

  # GET /habitos/1/edit
  def edit
    @parametro = Habito.find(params[:id])
    @collection = TipoHabito.where(:estatus => 1)
    @referencia = :tipo_habito_id

    render "parametros_select/edit"
  end

  # POST /habitos
  # POST /habitos.json
  def create
    @habito = Habito.new(habito_params)

    respond_to do |format|
      if @habito.save
        format.html { redirect_to habitos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @habito }
      else
        format.html { render :new }
        format.json { render json: @habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habitos/1
  # PATCH/PUT /habitos/1.json
  def update
    respond_to do |format|
      if @habito.update(habito_params)
        format.html { redirect_to habitos_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @habito }
      else
        format.html { render :edit }
        format.json { render json: @habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habitos/1
  # DELETE /habitos/1.json
  def destroy
    @habito.estatus = 2
    @habito.save
    respond_to do |format|
      format.html { redirect_to habitos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habito
      @habito = Habito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habito_params
      params.require(:habito).permit(:descripcion, :estatus, :tipo_habito_id)
    end
end
