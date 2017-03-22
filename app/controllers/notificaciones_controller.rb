class NotificacionesController < ApplicationController
  before_action :set_notificacion, only: [:show, :edit, :update, :destroy]

  # GET /notificaciones
  # GET /notificaciones.json
  def index
    if params[:usuario_id].nil?
    @parametros = Notificacion.where(:estatus => 1).or(Notificacion.where(:estatus => 2))
    else
      @parametros = Notificacion.where(usuario_id: params[:usuario_id], :estatus => 1).or(Notificacion.where(usuario_id: params[:usuario_id], :estatus => 2))
    end        
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /notificaciones/1
  # GET /notificaciones/1.json
  def show
    @parametro = Notificacion.find(params[:id])
    respond_to do |format|
      format.html {  render "parametros_select/edit" }
      format.json { render json: @parametro }
    end
  end

  # GET /notificaciones/new
  def new
    @parametro = Notificacion.new
    @collection = TipoNotificacion.where(:estatus => 1)
    @referencia = :tipo_notificacion_id
    render "parametros_select/new"
  end

  # GET /notificaciones/1/edit
  def edit
    @parametro = Notificacion.new
    @collection = TipoNotificacion.where(:estatus => 1)
    @referencia = :tipo_notificacion_id
    render "parametros_select/new"
  end

  # POST /notificaciones
  # POST /notificaciones.json
  def create
    @notificacion = Notificacion.new(notificacion_params)

    respond_to do |format|
      if @notificacion.save
        format.html { redirect_to action:"index", notice: 'Notificacion was successfully created.' }
        format.json { render :show, status: :created, location: @notificacion }
      else
        format.html { render :new }
        format.json { render json: @notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notificaciones/1
  # PATCH/PUT /notificaciones/1.json
  def update
    @notificacion = Notificacion.find(params[:id])
    #@descripcion = params[:descripcion]
    #@estatus = 2

    respond_to do |format|
      if @notificacion.update(estatus: 2)
        format.html { redirect_to action:"index", notice: 'Notificacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @notificacion }
      else
        format.html { render :edit }
        format.json { render json: @notificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notificaciones/1
  # DELETE /notificaciones/1.json
  def destroy
    @notificacion.estatus = 2
    @notificacion.save
    respond_to do |format|
      format.html { redirect_to notificaciones_url, notice: 'Notificacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notificacion
      @notificacion = Notificacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notificacion_params
      params.require(:notificacion).permit(:descripcion, :mensaje, :url, :estatus, :tipo_notificacion_id, :entidad_id)
    end
end
