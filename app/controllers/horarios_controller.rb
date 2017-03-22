class HorariosController < ApplicationController
  before_action :set_horario, only: [:show, :edit, :update, :destroy]
  # GET /horarios
  # GET /horarios.json
  def index
    @horarios = Horario.where(:estatus => 1)
    @tipoHorario = "tipo_horario"
  end

  # GET /horarios/1
  # GET /horarios/1.json
  def show
    @horario = Horario.find(params[:id])
    @turnosM = Turno.where(horario_id: @horario.id).rewhere(tipo_turno_id: 1).order(:dia_id)
    @turnosT = Turno.where(horario_id: @horario.id).rewhere(tipo_turno_id: 2).order(:dia_id)
    @dias = Dia.all    
  end

def disponibilidad
    d = params[:fecha].to_date #Date.new(2017,03,06) 
    @fecha = DateTime.new(d.year, d.month, d.day)
  
    @horario = Horario.where(servicio_id: params[:servicio_id]).take
    @horario.disponibilidad_cantidad_tiempo(@fecha)#params[:fecha1])
    respond_to do |format|
        format.html {  render "horarios/disponibilidad" }
        format.json { render json: {diponibles: @horario.disponibilidad_cantidad_tiempo(@fecha)}}#params[:fecha1])
           
    end
end
  def mi_horario
    if(current_usuario.servicio_id.nil?)
      redirect_to '/', notice: 'No hay horarios asociados'
      else
        @horario = Horario.where(:servicio_id => current_usuario.servicio_id).take
      redirect_to @horario
    end
  end

  def cerrar_turno
    @turno = Turno.find(params[:id])
      @horario = Horario.find(@turno.horario_id)
        if(@turno.tipo_turno_id == 1)
        @turno.update(cantidad_pacientes: 0 ,hora_inicio: "08:00:00" , hora_fin: "08:00:00")
         else
          @turno.update(cantidad_pacientes: 0 ,hora_inicio: "13:00:00",hora_fin: "13:00:00")
     end
     respond_to do |format|
        format.html { redirect_to '/horarios/'+@horario.id.to_s, notice: 'Turno Cerrado.' }
      end
  end
  # GET /horarios/new
  def new

    @horario = Horario.new
    @collection = TipoHorario.where(:estatus => 1)
    @referencia = :tipo_horario_id
    @collectionServ = Servicio.where(:estatus => 1)
    @referenciaServ = :servicio_id

  end

  # GET /horarios/1/edit
  def edit
    @horario = Horario.find(params[:id])
    @collection = TipoHorario.where(:estatus => 1)
    @referencia = :tipo_horario_id
     @collectionServ = Servicio.where(:estatus => 1)
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
    @horario = Horario.find(params[:id])
    @turnos = Turno.where(horario_id: @horario.id)
    respond_to do |format|
       if(@horario.tipo_horario_id==1)
        params[:tiempo_cita] = 0
            #@horario.tiempo_cita = 0
       else
             @horario.tiempo_cita = params[:tiempo_cita]
               @turnos.each do |turno|
                turno.update(cantidad_pacientes: 0,hora_inicio: "08:00:00" , hora_fin: "08:00:00")
                end 
      end
      if @horario.update(horario_params)
        format.html { redirect_to @horario, notice: 'EL registro fue modificado exitosamente.' }
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
    @horario.estatus = 2
    @horario.save
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
