class EncuestasController < ApplicationController
  before_action :set_encuesta, only: [:show, :edit, :update, :destroy]

  # GET /encuestas
  # GET /encuestas.json
  def index  
  end

  # GET /encuestas/1
  # GET /encuestas/1.json
  def show
  end

  # GET /encuestas/new
  def new  
    #@tipoServicio = TipoServicio.new
    #@tipoServicio.descripcion = "Tipo de servicio"
    #@tipoServicio.texto = "Texto"
    #@tipoServicio.estatus = 1
    #@tipoServicio.save
    
    #@servicio = Servicio.new 
    #@servicio.descripcion = "Servicio medico oftalmologico"
    #@servicio.estatus = 1
    #@servicio.tipo_servicio = @tipoServicio
    #@servicio.save
    
    #@horario = Horario.new
    #@horario.tiempo_cita = 30
    #@horario.estatus = 1
    #@horario.servicio = @servicio
    #@horario.save

    #@turno = Turno.new
    #@turno.hora_inicio = Time.now
    #@turno.hora_fin = Time.now
    #@turno.estatus = 1
    #@turno.horario = @horario
    #@turno.save
    
    @cita = Cita.find(48)
    #@criterio = Criterio.new
    #@criterio.descripcion = "Criterio 01"
    #@criterio.estatus = 1
    #@criterio.save

    #@criterioTipoServicio = CriterioTipoServicio.new
    #@criterioTipoServicio.criterio_id = @criterio.id
    #@criterioTipoServicio.tipo_servicio_id = @tipoServicio.id
    #@criterioTipoServicio.save

    #@criterio = Criterio.new
    #@criterio.descripcion = "Criterio 02"
    #@criterio.estatus = 1
    #@criterio.save
    
    #@tipoCalificacion = TipoCalificacion.new
    #@tipoCalificacion.descripcion = "Cuantitativa"
    #@tipoCalificacion.estatus = 1
    #@tipoCalificacion.save

    #@tipoCalificacion = TipoCalificacion.new
    #@tipoCalificacion.descripcion = "Cualitativa"
    #@tipoCalificacion.estatus = 1
    #@tipoCalificacion.save

    #@tipoCalificaciones = TipoCalificacion.all
    #@tipo_calificacion_id = :tipo_cita_id
    #@calificacion = Calificacion.new

    #@criterioTipoServicio = CriterioTipoServicio.new
    #@criterioTipoServicio.criterio_id = @criterio.id
    #@criterioTipoServicio.tipo_servicio_id = @tipoServicio.id
    #@criterioTipoServicio.save
    
    @criterios = Criterio.find(@cita.turno.horario.servicio.tipo_servicio.criterio_ids)
    
    end
  end

  # GET /encuestas/1/edit
  def edit
    
  end

  # POST /encuestas
  # POST /encuestas.json
  def create
    
  end

  # PATCH/PUT /encuestas/1
  # PATCH/PUT /encuestas/1.json
  def update
   
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
    def set_encuesta
      @evaluacion = Evaluacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encuesta_params
      params.require(:evaluacion).permit(:descripcion, :estatus, :tipo_evaluacion_id)
    end

  def por_post
   @respuesta = false;
   if request.post?
      @comentario = {
         :nombre => params[:nombre],
         :consulta => params[:comentario]
      };
   end
 end
