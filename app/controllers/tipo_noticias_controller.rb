class TipoNoticiasController < ApplicationController
  before_action :set_tipo_noticia, only: [:show, :edit, :update, :destroy]

  # GET /tipo_noticiaes
  # GET /tipo_noticiaes.json
  def index
    @parametros = TipoNoticia.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_noticiaes/1
  # GET /tipo_noticiaes/1.json
  def show
    @parametro = TipoNoticia.friendly.find(params[:id])

    render "parametros/show"
  end

  # GET /tipo_noticiaes/new
  def new
    @parametro = TipoNoticia.new

    render "parametros/new"
  end

  # GET /tipo_noticiaes/1/edit
  def edit
    @parametro = TipoNoticia.friendly.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_noticiaes
  # POST /tipo_noticiaes.json
  def create
    @tipo_noticia = TipoNoticia.new(tipo_noticia_params)

    respond_to do |format|
      if @tipo_noticia.save
        format.html { redirect_to tipo_noticias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_noticia }
      else
        format.html { render :new }
        format.json { render json: @tipo_noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_noticiaes/1
  # PATCH/PUT /tipo_noticiaes/1.json
  def update
    respond_to do |format|
      if @tipo_noticia.update(tipo_noticia_params)
        format.html { redirect_to tipo_noticias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_noticia }
      else
        format.html { render :edit }
        format.json { render json: @tipo_noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_noticiaes/1
  # DELETE /tipo_noticiaes/1.json
  def destroy
    @tipo_noticia.estatus = 2
    @tipo_noticia.save
    respond_to do |format|
      format.html { redirect_to tipo_noticias_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_noticia
      @tipo_noticia = TipoNoticia.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_noticia_params
      params.require(:tipo_noticia).permit(:descripcion, :estatus)
    end
end