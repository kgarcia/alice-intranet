class TipoBusquedasController < ApplicationController
  before_action :set_tipo_busqueda, only: [:show, :edit, :update, :destroy]

  # GET /tipo_busquedas
  # GET /tipo_busquedas.json
  def index
     @parametros = TipoBusqueda.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_busquedas/1
  # GET /tipo_busquedas/1.json
  def show
    @parametro = TipoBusqueda.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_busquedas/new
  def new
    @parametro = TipoBusqueda.new
    render "parametros/new"
  end

  # GET /tipo_busquedas/1/edit
  def edit
    @parametro = TipoBusqueda.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_busquedas
  # POST /tipo_busquedas.json
  def create
    @tipo_busqueda = TipoBusqueda.new(tipo_busqueda_params)

    respond_to do |format|
      if @tipo_busqueda.save
        format.html { redirect_to action:"index", notice: 'Tipo busqueda was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_busqueda }
      else
        format.html { render :new }
        format.json { render json: @tipo_busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_busquedas/1
  # PATCH/PUT /tipo_busquedas/1.json
  def update
    respond_to do |format|
      if @tipo_busqueda.update(tipo_busqueda_params)
        format.html { redirect_to action:"index", notice: 'Tipo busqueda was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_busqueda }
      else
        format.html { render :edit }
        format.json { render json: @tipo_busqueda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_busquedas/1
  # DELETE /tipo_busquedas/1.json
  def destroy
    @tipo_busqueda.estatus = 2
    @tipo_busqueda.save
    respond_to do |format|
      format.html { redirect_to tipo_busquedas_url, notice: 'Tipo busqueda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_busqueda
      @tipo_busqueda = TipoBusqueda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_busqueda_params
      params.require(:tipo_busqueda).permit(:descripcion, :estatus)
    end
end
