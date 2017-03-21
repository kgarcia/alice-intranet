class TurnosController < ApplicationController
  before_action :set_turno, only: [:show, :edit, :update, :destroy]

  # GET /turnos
  # GET /turnos.json
  def index
    @turnos = Turno.where(:estatus => 1)
    @dia ="dia"

  end

  # GET /turnos/1
  # GET /turnos/1.json
  def show
    @horarios = Horario.all
    @turno = Turno.find(params[:id])
    @dias = Dia.all
    @dia = :dia_id
    @referencia = :horario_id
    @collection_tipo_turno = TipoTurno.all 
    @referencia_tipo = :tipo_turno_id
    render "edit"
   
  end

  # GET /turnos/new
  def new
    @turno = Turno.new
    @dias = Dia.where(:estatus => 1)
    @horarios = Horario.where(:estatus => 1)
    @referencia = :horario_id
    @collection_tipo_turno = TipoTurno.where(:estatus => 1)
    @referencia_tipo = :tipo_turno_id
  end

  # GET /turnos/1/edit
  def edit
    @horarios = Horario.where(:estatus => 1)
    @turno = Turno.find(params[:id])
        @horario_show = Horario.find(@turno.horario_id)

    @dias = Dia.where(:estatus => 1)
    @dia = :dia_id
    @referencia = :horario_id
    @collection_tipo_turno = TipoTurno.where(:estatus => 1)
    @referencia_tipo = :tipo_turno_id
  end

  # POST /turnos
  # POST /turnos.json
  def create
    @turno = Turno.new(turno_params)
    
    @dias_turno = params[:dias]
    puts params
    @dias_turno.each do |d|
      @turno.dia_id = d
      @turno.estatus = 1
      @turno.save
      @turno = Turno.new(turno_params)
     
    end
    respond_to do |format|
   
        format.html { redirect_to turnos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render action:"index" , status: :created, location: @turno }
     
 
    end
  end
 
  # PATCH/PUT /turnos/1
  # PATCH/PUT /turnos/1.json
  def update
    respond_to do |format|
      if @turno.update(turno_params)
        format.html { redirect_to polymorphic_url(Horario.find(@turno.horario_id)), info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @turno }
      else
        format.html { render :edit }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1
  # DELETE /turnos/1.json
  def destroy
    @turno.estatus = 2
    @turno.save
    respond_to do |format|
      format.html { redirect_to turnos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turno
      @turno = Turno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turno_params
      params.require(:turno).permit( :hora_inicio, :hora_fin, :estatus, :dia_id, :horario_id,:cantidad_pacientes, :tipo_turno_id)
    end
end
