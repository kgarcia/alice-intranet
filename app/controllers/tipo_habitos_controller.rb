class TipoHabitosController < ApplicationController
  before_action :set_tipo_habito, only: [:show, :edit, :update, :destroy]

  # GET /tipo_habitos
  # GET /tipo_habitos.json
  def index
    @parametros = TipoHabito.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_habitos/1
  # GET /tipo_habitos/1.json
  def show
    @parametro = TipoHabito.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_habitos/new
  def new
    @parametro = TipoHabito.new
    render "parametros/new"
  end

  # GET /tipo_habitos/1/edit
  def edit
    @parametro = TipoHabito.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_habitos
  # POST /tipo_habitos.json
  def create
    @tipo_habito = TipoHabito.new(tipo_habito_params)

    respond_to do |format|
      if @tipo_habito.save
        format.html { redirect_to tipo_habitos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_habito }
      else
        format.html { render :new }
        format.json { render json: @tipo_habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_habitos/1
  # PATCH/PUT /tipo_habitos/1.json
  def update
    respond_to do |format|
      if @tipo_habito.update(tipo_habito_params)
        format.html { redirect_to tipo_habitos_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_habito }
      else
        format.html { render :edit }
        format.json { render json: @tipo_habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_habitos/1
  # DELETE /tipo_habitos/1.json
  def destroy
    @tipo_habito.estatus = 2
    @tipo_habito.save
    respond_to do |format|
      format.html { redirect_to tipo_habitos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_habito
      @tipo_habito = TipoHabito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_habito_params
      params.require(:tipo_habito).permit(:descripcion, :estatus)
    end
end
