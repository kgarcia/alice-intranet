class NoticiasController < ApplicationController
  before_action :set_noticia, only: [:show, :edit, :update, :destroy]

  # GET /noticias
  # GET /noticias.json
  def index
    if params[:id].nil?
      @parametros = Noticia.where(:estatus => 1)
    else
      @parametros = Noticia.where(tipo_noticia_id: params[:id])
    end

    respond_to do |format|
      format.html {  render "index" }
      format.json { render json: @parametros }
    end
  end

  # GET /noticias/1
  # GET /noticias/1.json
  def show
    @tipoNoticias = TipoNoticia.all
    respond_to do |format|
      format.html
      format.json 
    end
  end

  # GET /noticias/new
  def new
    @noticia = Noticia.new
    @tipoNoticias = TipoNoticia.where(:estatus => 1)
  end

  # GET /noticias/1/edit
  def edit
    @tipoNoticias = TipoNoticia.friendly.where(:estatus => 1)
  end

  # POST /noticias
  # POST /noticias.json
  def create
    @noticia = Noticia.new(noticia_params)

    respond_to do |format|
      if @noticia.save
        format.html { redirect_to noticias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @noticia }
      else
        format.html { render :new }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /noticias/1
  # PATCH/PUT /noticias/1.json
  def update
    respond_to do |format|
      if @noticia.update(noticia_params)
        format.html { redirect_to noticias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @noticia }
      else
        format.html { render :edit }
        format.json { render json: @noticia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticias/1
  # DELETE /noticias/1.json
  def destroy
    @noticia.estatus = 2
    @noticia.save
    respond_to do |format|
      format.html { redirect_to noticias_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_noticia
      @noticia = Noticia.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def noticia_params
      params.require(:noticia).permit(:titulo, :descripcion, :tipo_noticia_id, :estatus, :contenido)
    end
end
