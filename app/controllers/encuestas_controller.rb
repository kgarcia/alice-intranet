class EncuestasController < ApplicationController
  before_action :set_encuesta, only: [:show, :edit, :update, :destroy]

  # GET /encuestas
  # GET /encuestas.json
  def index  
    #index de la pantalla nueva
    #@citas = Cita.where({:persona_id => current_usuario.persona_id , :estatus => 4})
  end

  # GET /encuestas/1
  # GET /encuestas/1.json
  def show
  end

  # GET /encuestas/new
  def new  
    @cita = Cita.find(1)
    @criterios = Criterio.where(:estatus => 1)
    @evaluacion = Evaluacion.find(1)

    #@calificaciones = []
    if @evaluacion.new_record?
      @criterios.each do |criterio|
        @calificacion = Calificacion.new
        @calificacion.descripcion = "Probando..."
        @calificacion.evaluacion_id = @evaluacion.id
        @calificacion.criterio_id = criterio.id
        @calificacion.estatus = 1    
        #@calificacion.save
        #setear los atributos de relacion a la calificacion
        #@calificaciones.push(@calificacion)
        @evaluacion.calificaciones << @calificacion        
      end
      @evaluacion.calificaciones.build 
    end

    
  end

  # GET /encuestas/1/edit
  def edit
    
  end

  # POST /encuestas
  # POST /encuestas.json
  def create
    @calificaciones = params[:calificaciones]
    puts @calificaciones
  end

  # PATCH/PUT /encuestas/1
  # PATCH/PUT /encuestas/1.json
  def update
    @calificaciones = params[:calificaciones]
    puts @calificaciones
   
  end

  # DELETE /encuestas/1
  # DELETE /encuestas/1.json
  def destroy
    @encuesta.destroy
    respond_to do |format|
      format.html { redirect_to encuesta_url, notice: 'Encuesta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_evaluacion
    @evaluacion = Evaluacion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #def encuesta_params
  #  params.require(:evaluacion).permit(:descripcion, :estatus, :tipo_evaluacion_id)
  #end

  def evaluacion_params
    params.require(:evaluacion).permit(:name, calificaciones_attributes: [:id, :criterio_id, :descripcion])
  end
end