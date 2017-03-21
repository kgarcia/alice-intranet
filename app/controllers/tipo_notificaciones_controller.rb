class TipoNotificacionesController < ApplicationController
  before_action :set_tipo_notificacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_notificaciones
  # GET /tipo_notificaciones.json
  def index
    @tipo_notificaciones = TipoNotificacion.where(:estatus => 1)
  end

  # GET /tipo_notificaciones/1
  # GET /tipo_notificaciones/1.json
  def show
  end

  # GET /tipo_notificaciones/new
  def new
    @tipo_notificacion = TipoNotificacion.new
  end

  # GET /tipo_notificaciones/1/edit
  def edit
  end

  # POST /tipo_notificaciones
  # POST /tipo_notificaciones.json
  def create
    @tipo_notificacion = TipoNotificacion.new(tipo_notificacion_params)

    respond_to do |format|
      if @tipo_notificacion.save
        format.html { redirect_to tipo_notificaciones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_notificacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_notificaciones/1
  # PATCH/PUT /tipo_notificaciones/1.json
  def update
    respond_to do |format|
      if @tipo_notificacion.update(tipo_notificacion_params)
        format.html { redirect_to tipo_notificaciones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_notificacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_notificaciones/1
  # DELETE /tipo_notificaciones/1.json
  def destroy
    @tipo_notificacion.estatus = 2
    @tipo_notificacion.save
    respond_to do |format|
      format.html { redirect_to tipo_notificaciones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_notificacion
      @tipo_notificacion = TipoNotificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_notificacion_params
      params.require(:tipo_notificacion).permit(:descripcion, :estatus)
    end
end
