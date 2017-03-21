class TipoServiciosController < ApplicationController
  before_action :set_tipo_servicio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_servicios
  # GET /tipo_servicios.json
  def index
    
    if params[:slug].nil?
      @tipo_servicios = TipoServicio.where(:estatus => 1)
    else

      @categoria_id = Categoria.where(slug: params["slug"]).take.id

      @tipo_servicios = TipoServicio.where(categoria_id: @categoria_id, estatus: 1)
    end

    respond_to do |format|
      format.html 
      format.json { render json: @tipo_servicios }
    end
  end
  
 def filtrar
    @servicios = Servicio.where(tipo_servicio_id: params[:tipo_servicio_id])
    respond_to do |format|
      format.html
      format.json { render json: @servicios.to_json }
    end
  end
  # GET /tipo_servicios/1
  # GET /tipo_servicios/1.json
  def show
    #self.koala
  end

  # GET /tipo_servicios/new
  def new
    @tipo_servicio = TipoServicio.new
    @tipos_atencion = TipoAtencion.where(:estatus => 1)
    @especialidades = Especialidad.where(:estatus => 1)
    @categorias = Categoria.where(:estatus => 1)
    @perfiles = Perfil.where(:estatus => 1)
    @criterios = Criterio.where(:estatus => 1)
  end

  # GET /tipo_servicios/1/edit
  def edit
    @tipos_atencion = TipoAtencion.where(:estatus => 1)
    @especialidades = Especialidad.where(:estatus => 1)
    @categorias = Categoria.where(:estatus => 1)
    @perfiles = Perfil.where(:estatus => 1)
    @criterios = Criterio.where(:estatus => 1)
  end

  # POST /tipo_servicios
  # POST /tipo_servicios.json
  def create
    @tipo_servicio = TipoServicio.new(tipo_servicio_params)
    @tipo_servicio.perfilesTipoServicio = params[:perfiles]
    @tipo_servicio.criteriosTipoServicio = params[:criterios]


    respond_to do |format|     
      if @tipo_servicio.save
        
        format.html { redirect_to tipo_servicios_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_servicio }
      else
        format.html { render :new }
        format.json { render json: @tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

   def koala

    @user_graph = Koala::Facebook::API.new('EAANVgP46xeoBAPQYTJZArDgzsX2GEuPMCJJXIJmMW5ZCrFtZC0AYGkVhs8EZB4V4rRQZCZCoWHIppy1JWGXEPT7mzwMHI9bwpTruMAYE4XPbTyuv1t9wwcCBvkJEsj6C6s84nYEq8Q2AHaeUm6odG8vZAatv4HqcEQZD')
    # retrieve collection fo all your managed pages: returns collection of hashes with page id, name, category, access token and permissions
    pages = @user_graph.get_connections('me', 'accounts')
    # get access token for first page
    @page_token = pages.first['access_token']

    # or: retrieve access_token for a given page_id
    #page_token = @user_graph.get_page_access_token(page_id)

    #@page_token = "EAACEdEose0cBAAJAIpZBEZAFqwZAXttJ8bRyrOBC5kDWC1p2RZB3DsuUkhQjUgEOZBf9ZCAMHAlHE3QYRNdToS7r3Xj6SzONxe4OThMZBSZCAfLF5L8Ve3w6xXnsiu19Bf8mAVtDdwHkJeuoovHfok8mfYBBaKbd8MmHn3gi2gClfAPqX88anAB8qUgYFxCZByGQZD"
 
    @page_graph = Koala::Facebook::API.new(@page_token)

    @page_graph.get_object('me') # I'm a page
    @page_graph.get_connection('me', 'feed') # the page's wall
    #@page_graph.put_wall_post('Website') # post as page, requires new publish_pages permission
  #  @page_graph.put_connections("AliceLaTrinidad", 'feed', :message => message, :picture => picture_url, :link => link_url)
    @tipo_servicio = TipoServicio.last
    #@page_graph.put_picture(Rails.public_path+'bardenova.jpg', ".jpg", {:caption => @tipo_servicio.descripcion}, "me")

  end

  # PATCH/PUT /tipo_servicios/1
  # PATCH/PUT /tipo_servicios/1.json
  def update
    @tipo_servicio.perfilesTipoServicio = params[:perfiles]
    @tipo_servicio.criteriosTipoServicio = params[:criterios]

    respond_to do |format|
      if @tipo_servicio.update(tipo_servicio_params)
        format.html { redirect_to tipo_servicios_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_servicio }
      else
        format.html { render :edit }
        format.json { render json: @tipo_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_servicios/1
  # DELETE /tipo_servicios/1.json
  def destroy
    @tipo_servicio.estatus = 2
    @tipo_servicio.save
    respond_to do |format|
      format.html { redirect_to tipo_servicios_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_servicio
      @tipo_servicio = TipoServicio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_servicio_params
      params.require(:tipo_servicio).permit(:descripcion, :texto, :foto, :estatus, :tipo_atencion_id, :categoria_id, :especialidad_id)
    end
end
