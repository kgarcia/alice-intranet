class TipoHorariosController < ApplicationController
  before_action :set_tipo_horario, only: [:show, :edit, :update, :destroy]

  # GET /tipo_horarios
  # GET /tipo_horarios.json
  def index
    @parametros = TipoHorario.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_horarios/1
  # GET /tipo_horarios/1.json
  def show
    @parametro = TipoHorario.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_horarios/new
  def new
    @parametro = TipoHorario.new

    render "parametros/new"
  end

  # GET /tipo_horarios/1/edit
  def edit
    @parametro = TipoHorario.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_horarios
  # POST /tipo_horarios.json
  def create
    @tipo_horario = TipoHorario.new(tipo_horario_params)

    respond_to do |format|
      if @tipo_horario.save
        format.html { redirect_to tipo_horarios_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_horario }
      else
        format.html { render :new }
        format.json { render json: @tipo_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_horarios/1
  # PATCH/PUT /tipo_horarios/1.json
  def update
    respond_to do |format|
      if @tipo_horario.update(tipo_horario_params)
        format.html { redirect_to tipo_horarios_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_horario }
      else
        format.html { render :edit }
        format.json { render json: @tipo_horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_horarios/1
  # DELETE /tipo_horarios/1.json
  def destroy
    @tipo_horario.estatus = 2
    @tipo_horario.save
    respond_to do |format|
      format.html { redirect_to tipo_horarios_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_horario
      @tipo_horario = TipoHorario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_horario_params
      params.require(:tipo_horario).permit(:descripcion, :estatus)
    end
end
