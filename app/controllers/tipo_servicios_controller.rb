class TipoServiciosController < ApplicationController
  before_action :set_tipo_servicio, only: [:show, :edit, :update, :destroy]

  # GET /tipo_servicios
  # GET /tipo_servicios.json
  def index
    @tipo_servicios = TipoServicio.all
  end

  # GET /tipo_servicios/1
  # GET /tipo_servicios/1.json
  def show
    self.koala
  end

  # GET /tipo_servicios/new
  def new
    @tipo_servicio = TipoServicio.new
    @tipos_atencion = TipoAtencion.all
    @especialidades = Especialidad.all
    @categorias = Categoria.all

    @adicciones = Adiccion.all
    @cirugias = Cirugia.all
    @discapacidades = Discapacidad.all
    @estado_civiles = EstadoCivil.all
    @grupo_sanguineos = GrupoSanguineo.all
    @habitos = Habito.all
    @lesiones = Lesion.all
    @ocupaciones = Ocupacion.all
    @patologias = Patologia.all
    @profesiones = Profesion.all
    @sexos = Sexo.all
    @vacunas = Vacuna.all
  end

  # GET /tipo_servicios/1/edit
  def edit
    @tipos_atencion = TipoAtencion.all
    @especialidades = Especialidad.all
    @categorias = Categoria.all

    @adicciones = Adiccion.all
    @cirugias = Cirugia.all
    @discapacidades = Discapacidad.all
    @estado_civiles = EstadoCivil.all
    @grupo_sanguineos = GrupoSanguineo.all
    @habitos = Habito.all
    @lesiones = Lesion.all
    @ocupaciones = Ocupacion.all
    @patologias = Patologia.all
    @profesiones = Profesion.all
    @sexos = Sexo.all
    @vacunas = Vacuna.all

  end

  # POST /tipo_servicios
  # POST /tipo_servicios.json
  def create
    @tipo_servicio = TipoServicio.new(tipo_servicio_params)
    @tipo_servicio.adiccionesTipoServicio = params[:adicciones]
    @tipo_servicio.cirugiasTipoServicio = params[:cirugias]
    @tipo_servicio.discapacidadesTipoServicio = params[:discapacidades]
    @tipo_servicio.estadoCivilesTipoServicio = params[:estado_civiles]
    @tipo_servicio.grupoSanguineosTipoServicio = params[:grupo_sanguineos]
    @tipo_servicio.habitosTipoServicio = params[:habitos]
    @tipo_servicio.lesionesTipoServicio = params[:lesiones]
    @tipo_servicio.ocupacionesTipoServicio = params[:ocupaciones]
    @tipo_servicio.patologiasTipoServicio = params[:patologias]
    @tipo_servicio.profesionesTipoServicio = params[:profesiones]
    @tipo_servicio.sexosTipoServicio = params[:sexos]
    @tipo_servicio.vacunasTipoServicio = params[:vacunas]


    respond_to do |format|     
      if @tipo_servicio.save
        
        puts @tipo_servicio.inspect
        format.html { redirect_to @tipo_servicio, notice: 'Tipo servicio was successfully created.' }
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
    @tipo_servicio.adiccionesTipoServicio = params[:adicciones]
    @tipo_servicio.cirugiasTipoServicio = params[:cirugias]
    @tipo_servicio.discapacidadesTipoServicio = params[:discapacidades]
    @tipo_servicio.estadoCivilesTipoServicio = params[:estado_civiles]
    @tipo_servicio.grupoSanguineosTipoServicio = params[:grupo_sanguineos]
    @tipo_servicio.habitosTipoServicio = params[:habitos]
    @tipo_servicio.lesionesTipoServicio = params[:lesiones]
    @tipo_servicio.ocupacionesTipoServicio = params[:ocupaciones]
    @tipo_servicio.patologiasTipoServicio = params[:patologias]
    @tipo_servicio.profesionesTipoServicio = params[:profesiones]
    @tipo_servicio.sexosTipoServicio = params[:sexos]
    @tipo_servicio.vacunasTipoServicio = params[:vacunas]

    respond_to do |format|
      if @tipo_servicio.update(tipo_servicio_params)
        format.html { redirect_to @tipo_servicio, notice: 'Tipo servicio was successfully updated.' }
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
    @tipo_servicio.destroy
    respond_to do |format|
      format.html { redirect_to tipo_servicios_url, notice: 'Tipo servicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_servicio
      @tipo_servicio = TipoServicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_servicio_params
      params.require(:tipo_servicio).permit(:descripcion, :texto, :foto, :estatus, :tipo_atencion_id, :categoria_id, :especialidad_id)
    end
end
