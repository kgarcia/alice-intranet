  class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]

  # GET /citas
  # GET /citas.json
  def index
    if params[:persona].nil?
      @lista = Cita.where({:usuario_id => current_usuario.id, :estatus => 1})
    else
      @lista = Cita.where({:usuario_id => params[:persona]})
    end
      respond_to do |format|
      format.html
      format.json { render json: @lista }
    end
  end

  # GET /citas/1
  # GET /citas/1.json
  def show 
    if Cita.exists?(id: params[:id])
        @parametro = Cita.find(params[:id])
    else
      @parametro = Cita.new
    end
    respond_to do |format|
      if !@parametro.id.nil?
        format.html
        format.json { render json: @parametro.to_json }
      else
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /citas/new
  def new
    @cita = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas
  # POST /citas.json
  def create
    @persona = Persona.where(:cedula => params[:paciente_cedula]).take
    @cita = Cita.new(cita_params)
    @cita.estatus = 1
    @cita.persona_id = @persona.id
    respond_to do |format|
      if @cita.save
        if Configuracion.envia_email
          ExampleMailer.cita_registrada(@cita).deliver_now
        end
        if Configuracion.envia_notificaciones
          Notificacion.create(descripcion:"Solicitud de cita.", mensaje: "Haz solicitado una cita para el servicio "+@cita.turno.horario.servicio.descripcion, url:"", usuario_id:@cita.usuario_id, tipo_notificacion_id: 1, entidad_id: @cita.id )
        end
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1
  # PATCH/PUT /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita.estatus = 2
    @cita.save
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'Cita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def historial
    @histo = Cita.where({:usuario_id => current_usuario.id, :estatus => [3,4,5]})
  end

  def cancelarCita
    @cita = Cita.find(params[:id])
    @collection_tipo = TipoEventualidad.all
    @collection_motivo = Motivo.all
    @referencia_tipo ="tipo_eventualidad_id"
    @referencia_motivo = "motivo_id"
    @eventualidad = Eventualidad.new

    render "cancelarCitas"
  end

  def confirmarCancelacion
    @cita = Cita.find(params[:cita_id])
    @historialCita = HistorialCita.new(fecha: DateTime.now, estatus_anterior: @cita.estatus, estatus_nuevo: 5, cita:@cita)
    @cita.estatus = 5
    @eventualidad = Eventualidad.new(eventualidad_params)
    @eventualidad.tipo_eventualidad_id = 1
    @eventualidad.fecha_inicio = Date.today()
    @eventualidad.fecha_fin = Date.today()
    @eventualidad.save
    @cita.eventualidad_id = @eventualidad.id
    @cita.save
    @historialCita.save
    redirect_to citas_url
  end

   def cancelar_movil
    @cita = Cita.find(params[:id])
    @cita.estatus = 5
    @eventualidad = Eventualidad.new(:descripcion => 'Cancelada por Movil', :tipo_eventualidad_id => 3, :motivo_id => 4, :fecha_inicio => DateTime.now, :fecha_fin => DateTime.now)
    @eventualidad.tipo_eventualidad_id = 1
    @eventualidad.fecha_inicio = Date.today()
    @eventualidad.fecha_fin = Date.today()
    @eventualidad.save
    @cita.eventualidad_id = @eventualidad.id
    @cita.save
    respond_to do |format|
      format.json {render @cita}
    end
  end

  def chequear
    @citas = Cita.joins(turno: { horario: :servicio } ).where("horarios.servicio_id" => current_usuario.servicio_id ).where(:estatus => 1)
  end

  def chequearCita
    @cita = Cita.find(params[:id])
    @sexos = Sexo.all
    @persona = @cita.persona

    render "chequear_citas"
  end

  def guardarChequearCita
    @cita = Cita.find(params[:cita_id])
    @persona = @cita.persona
    @persona.update(persona_params)
    @cita.estatus = 2
    @cita.save
    @historialCita = HistorialCita.new(fecha: DateTime.now, estatus_anterior: 1, estatus_nuevo: 2, cita:@cita)
    @historialCita.save
    redirect_to "/chequear_cita"
  end

  def finalizar
    @citas = Cita.joins(turno: { horario: :servicio } ).where("horarios.servicio_id" => current_usuario.servicio_id ).where(:estatus => 2)
  end

  def finalizarCita
    @cita = Cita.find(params[:id])
    @persona = @cita.persona
    
    @adicciones = Adiccion.all
    @cirugias = Cirugia.all
    @discapacidades = Discapacidad.all
    @estado_civiles = EstadoCivil.all
    @grupo_sanguineos = GrupoSanguineo.all
    @lesiones = Lesion.all
    @patologias = Patologia.all
    @sexos = Sexo.all
    @vacunas = Vacuna.all
    
    render "finalizar_citas"
  end

  def guardarFinalizarCita
   
    @cita = Cita.find(params[:cita_id])
    @persona = @cita.persona
    @persona.update(persona_params)
    @cita.estatus = 3
    @cita.update(cita_params)
    @cita.save
    @historialCita = HistorialCita.new(fecha: DateTime.now, estatus_anterior: 2, estatus_nuevo: 3, cita:@cita)
    @historialCita.save
    if Configuracion.envia_notificaciones
      Notificacion.create(descripcion:"Evaluacion de cita.", mensaje: "Por favor, envianos tu evaluacion sobre tu cita sobre el servicio "+@cita.turno.horario.servicio.descripcion, url:"", usuario_id:@cita.usuario_id, tipo_notificacion_id: 1, entidad_id: @cita.id )
    end
    redirect_to "/finalizar_cita"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      if Cita.exists?(id: params[:id])
        @cita = Cita.find(params[:id])
      else
        @cita = Cita.new
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cita_params
      params.require(:cita).permit(:turno_id, :persona_id, :usuario_id, :fecha, :tipo_pago_id, :tipo_cita_id, :eventualidad_id, :estatus, :diagnostico)
    end

    def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento, :sexo_id, :grupo_sanguineo_id, :estado_civil_id,:altura,:peso)
    end
  def eventualidad_params
    params.require(:eventualidad).permit(:descripcion, :estatus, :tipo_eventualidad_id, :motivo_id, :fecha_inicio, :fecha_fin)
  end
end
