class DifusionesController < ApplicationController
  before_action :set_difusion, only: [:show, :edit, :update, :destroy]

  # GET /difusiones
  # GET /difusiones.json
  def index
    @difusiones = Difusion.where(:estatus => 1)
  end

  # GET /difusiones/1
  # GET /difusiones/1.json
  def show
  end

  # GET /difusiones/new
  def new
    @difusion = Difusion.new
    @tipo_entidades = TipoEntidad.where(:estatus => 1)
    @tipo_difusiones = TipoDifusion.where(:estatus => 1)
    @entidades = Servicio.where(:estatus => 1)
    @medios = MedioDifusion.where(:estatus => 1)
  end

  # GET /difusiones/1/edit
  def edit
    @tipo_entidades = TipoEntidad.where(:estatus => 1)
    @tipo_difusiones = TipoDifusion.where(:estatus => 1)
    if(@difusion.tipo_entidad_id == 1)
      @entidades = Servicio.where(:estatus => 1)
    else
      @entidades = Evento.where(:estatus => 1)
    end
    @medios = MedioDifusion.where(:estatus => 1)
  end

  # POST /difusiones
  # POST /difusiones.json
  def create
    @difusion = Difusion.new(difusion_params)
    @difusion.difusionesMedioDifusion = params[:medios]

    respond_to do |format|
      if @difusion.save
        if @difusion.tipo_difusion_id == 1 
          if @difusion.medio_difusiones.include?(MedioDifusion.find(1)) #email
            if(@difusion.tipo_entidad_id == 1)
              @tipoServicio = Servicio.find(@difusion.entidad_id).tipo_servicio
              @tipoServicio.difundirGeneral(@difusion)
            else
              @tipoServicios = Evento.find(@difusion.entidad_id).tipo_servicios
              @tipoServicios.each do |tipoServicio|
                tipoServicio.difundirGeneral(@difusion)
              end
            end  
          end

          if @difusion.medio_difusiones.include?(MedioDifusion.find(2)) #fb
            if(@difusion.tipo_entidad_id == 1)
              @servicio = Servicio.find(@difusion.entidad_id)
              @servicio.postearFb(@difusion)
            else
              @evento = Evento.find(@difusion.entidad_id)
              @evento.postearFb(@difusion)
            end  
          end

          if @difusion.medio_difusiones.include?(MedioDifusion.find(3)) #notificacion movil
            if(@difusion.tipo_entidad_id == 1)
              @tipoServicio = Servicio.find(@difusion.entidad_id).tipo_servicio
              @tipoServicio.notificarGeneral(@difusion)
            else
              @tipoServicios = Evento.find(@difusion.entidad_id).tipo_servicios
              @tipoServicios.each do |tipoServicio|
                tipoServicio.notificarGeneral(@difusion)
              end
            end  
          end
        else
          if @difusion.medio_difusiones.include?(MedioDifusion.find(1)) #email
            if(@difusion.tipo_entidad_id == 1)
              @tipoServicio = Servicio.find(@difusion.entidad_id).tipo_servicio
              @tipoServicio.difundirSegmentado(@difusion)
            else
              @tipoServicios = Evento.find(@difusion.entidad_id).tipo_servicios
              @tipoServicios.each do |tipoServicio|
                tipoServicio.difundirSegmentado(@difusion)
              end
            end  
          end

          if @difusion.medio_difusiones.include?(MedioDifusion.find(2)) #fb
            if(@difusion.tipo_entidad_id == 1)
              @servicio = Servicio.find(@difusion.entidad_id)
              @servicio.postearFb(@difusion)
            else
              @evento = Evento.find(@difusion.entidad_id)
              @evento.postearFb(@difusion)
            end  
          end

          if @difusion.medio_difusiones.include?(MedioDifusion.find(3)) #notificacion movil
            if(@difusion.tipo_entidad_id == 1)
              @tipoServicio = Servicio.find(@difusion.entidad_id).tipo_servicio
              @tipoServicio.notificarSegmentado(@difusion)
            else
              @tipoServicios = Evento.find(@difusion.entidad_id).tipo_servicios
              @tipoServicios.each do |tipoServicio|
                tipoServicio.notificarSegmentado(@difusion)
              end
            end  
          end
        end
        
        
        
        format.html { redirect_to difusiones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @difusion }
      else
        format.html { render :new }
        format.json { render json: @difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /difusiones/1
  # PATCH/PUT /difusiones/1.json
  def update
    @difusion.difusionesMedioDifusion = params[:medios]
    respond_to do |format|
      if @difusion.update(difusion_params)
        format.html { redirect_to difusiones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @difusion }
      else
        format.html { render :edit }
        format.json { render json: @difusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /difusiones/1
  # DELETE /difusiones/1.json
  def destroy
    @difusion.estatus = 2
    @difusion.save
    respond_to do |format|
      format.html { redirect_to difusiones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  def update_entidades

    if (params[:tipo_entidad_id].to_i == 1)
      @entidades = Servicio.where(:estatus => 1)
    else
      @entidades = Evento.where(:estatus => 1)
    end
    respond_to do |format|
      format.js
      render 'difusiones/update_entidades'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_difusion
      @difusion = Difusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def difusion_params
      params.require(:difusion).permit(:asunto, :texto, :imagen, :tipo_entidad_id, :entidad_id, :token_facebook, :tipo_difusion_id, :estatus, :avatar)
    end
end
