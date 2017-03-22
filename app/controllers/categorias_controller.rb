class CategoriasController < ApplicationController
  before_action :set_categoria, only: [:show, :edit, :update, :destroy]

  # GET /categorias
  # GET /categorias.json
  def index

    if params[:id].nil?
      @parametros = Categoria.where(:estatus => 1)
    else
      @parametros = Categoria.where(id: params[:id], estatus: 1)
    end

    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /categorias/1
  # GET /categorias/1.json
  def show
    @parametro = Categoria.friendly.find(params[:id])
    puts '##########################################'
    puts @parametro.as_json
    puts '##########################################'
    respond_to do |format|
      
      format.json { render json: @parametro.to_json }
    end
    #render "parametros/edit"
  end

  # GET /categorias/new
  def new
    @categoria = Categoria.new
  end

  # GET /categorias/1/edit
  def edit
    @categoria = Categoria.friendly.find(params[:id])

  end

  # POST /categorias
  # POST /categorias.json
  def create
    @categoria = Categoria.new(categoria_params)

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to categorias_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @categoria }
      else
        format.html { render :new }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categorias/1
  # PATCH/PUT /categorias/1.json
  def update
    respond_to do |format|
      if @categoria.update(categoria_params)
        format.html { redirect_to categorias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @categoria }
      else
        format.html { render :edit }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.json
  def destroy
    @categoria.estatus = 2
    @categoria.save
    respond_to do |format|
      format.html { redirect_to categorias_url, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoria
      @categoria = Categoria.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoria_params
      params.require(:categoria).permit(:descripcion, :estatus, :foto)
    end
end
