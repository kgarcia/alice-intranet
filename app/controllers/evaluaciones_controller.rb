class EvaluacionesController < ApplicationController
  before_action :set_evaluacion, only: [:show, :edit, :update, :destroy]

  # GET /evaluaciones
  # GET /evaluaciones.json
  def index
    @parametros = Cita.where({:persona_id => current_usuario.persona_id , :estatus => 4}) #current_usuario.persona_id
    
  end

  # GET /evaluaciones/1
  # GET /evaluaciones/1.json
  def show
  end

  # GET /evaluaciones/new
  def new
    
  end

  def evaluarCita
    @cita = Cita.find(params[:id])
    puts @cita
    @criterios = @cita.turno.horario.servicio.tipo_servicio.criterios
    puts @criterios

    @evaluacion = Evaluacion.new
    @evaluacion.descripcion = "Descripcion de la evaluacion"
    #@calificaciones = []
    if @evaluacion.new_record?
      @criterios.each do |criterio|
        @calificacion = Calificacion.new      
        @calificacion.evaluacion_id = @evaluacion.id
        @calificacion.criterio_id = criterio.id
        @calificacion.estatus = 1    
        
        @evaluacion.calificaciones.push(@calificacion)        
      end      
    end
    #@evaluacion.calificaciones.build 
    @cita.estatus = 1
    @cita.save
    render "new"
  end

  # GET /evaluaciones/1/edit
  def edit
    @parametro = Evaluacion.find(params[:id])
    @collection = TipoEvaluacion.all
    @referencia = :tipo_evaluacion_id
    render "parametros_select/edit"
  end

  # POST /evaluaciones
  # POST /evaluaciones.json
  def create
    @evaluacion = Evaluacion.new(evaluacion_params)
    @evaluacion.descripcion = "Evaluacion de la cita #" + @evaluacion.cita_id.to_s

    respond_to do |format|
      if @evaluacion.save
        format.html { redirect_to evaluaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @evaluacion }
      else
        format.html { render :new }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluaciones/1
  # PATCH/PUT /evaluaciones/1.json
  def update
    @evaluacion.estatus = 1
    respond_to do |format|
      if @evaluacion.update(evaluacion_params)
        format.html { redirect_to evaluaciones_path, notice: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @evaluacion }
      else
        format.html { render :edit }
        format.json { render json: @evaluacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluaciones/1
  # DELETE /evaluaciones/1.json
  def destroy
    @evaluacion.destroy
    respond_to do |format|
      format.html { redirect_to evaluaciones_path, notice: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluacion
      @evaluacion = Evaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluacion_params
      params.require(:evaluacion).permit(:descripcion, :estatus, :tipo_evaluacion_id, calificaciones_attributes: [:id, :criterio_id, :descripcion])
    end

end
