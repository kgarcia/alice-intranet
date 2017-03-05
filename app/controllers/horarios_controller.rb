class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]
  # GET /horarios
  # GET /horarios.json
  def index
    @horarios = Horario.all
    @tipoHorario = "tipo_horario"
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
    #current_usuario.persona.id.where(horario.id)
    @horario = Horario.where(servicio_id: current_usuario.persona.especialista.servicio)
    #@horario = Horario.find(params[:id])
    @turnosM = Turno.where(horario_id: @horario.id).rewhere(tipo_turno_id: 1)
    @turnosT = Turno.where(horario_id: @horario.id).rewhere(tipo_turno_id: 2)
    @dias = Dia.all    
  end

  # GET /horarios/new
  def new

    @horario = Horario.new
    @collection = TipoHorario.all
    @referencia = :tipo_horario_id
    @collectionServ = Servicio.all
    @referenciaServ = :servicio_id

  end

  # GET /horarios/1/edit
  def edit
    @horario = Horario.find(params[:id])
    @collection = TipoHorario.all
    @referencia = :tipo_horario_id
     @collectionServ = Servicio.all
    @referenciaServ = :servicio_id
  end

  # POST /horarios
  # POST /horarios.json
  def create
    @horario = Horario.new(horario_params)
    @horario.estatus = 1
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
      params.require(:horario).permit(:tipo_horario_id,:tiempo_cita, :estatus,:servicio_id)
    end
end
