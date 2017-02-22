class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]
  # GET /horarios
  # GET /horarios.json
  def index
    @parametros = Horario.all
    @referencia = "tipoHorario"
    render "parametros_select/index"
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
    @horario = Horario.find(params[:id])
    @turnos = Turno.where(horario_id: @horario.id)
    @dias = Dia.all
    
  end

  # GET /horarios/new
  def new

    @horario = Horario.new
    @collection = TipoHorario.all
    @referencia = :tipo_horario_id

  end

  # GET /horarios/1/edit
  def edit
    @horario = Horario.find(params[:id])
    @collection = TipoHorario.all
    @referencia = :tipo_horario_id
  end

  # POST /horarios
  # POST /horarios.json
  def create
    @horario = Horario.new(horario_params)

    respond_to do |format|
      if @horario.save
        format.html { redirect_to @horario, notice: 'Horario was successfully created.' }
        format.json { render :show, status: :created, location: @horario }
      else
        format.html { render :new }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /horarios/1
  # PATCH/PUT /horarios/1.json
  def update
    respond_to do |format|
      if @horario.update(horario_params)
        format.html { redirect_to @horario, notice: 'Horario was successfully updated.' }
        format.json { render :show, status: :ok, location: @horario }
      else
        format.html { render :edit }
        format.json { render json: @horario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /horarios/1
  # DELETE /horarios/1.json
  def destroy
    @horario.destroy
    respond_to do |format|
      format.html { redirect_to horarios_url, notice: 'Horario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_horario
      @horario = Horario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def horario_params
      params.require(:horario).permit(:descripcion, :tipo_horario_id, :estatus, :limite_horario)
    end
end
