class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :edit, :update, :destroy]

  # GET /estados
  # GET /estados.json
  def index
    @tipo = Pais.titulo
    @parametros = Estado.where(:estatus => 1)
     respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /estados/1
  # GET /estados/1.json
  def show
    @parametro = Estado.find(params[:id])

    #render "parametros_select/edit"
  end

  # GET /estados/new
  def new
    @parametro = Estado.new
    @collection = Pais.where(:estatus => 1)
    @referencia = :pais_id
    @estado = Estado.new
    render "parametros_select/new"
  end

  # GET /estados/1/edit
  def edit
    @parametro = Estado.find(params[:id])
    @collection = Pais.where(:estatus => 1)
    @referencia = :pais_id
    @estado = Estado.new
    render "parametros_select/edit"
  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(estado_params)

    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @estado }
      else
        format.html { render :new }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estados/1
  # PATCH/PUT /estados/1.json
  def update
    respond_to do |format|
      if @estado.update(estado_params)
        format.html { redirect_to estados_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @estado }
      else
        format.html { render :edit }
        format.json { render json: @estado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estados/1
  # DELETE /estados/1.json
  def destroy
    @estado.estatus = 2
    @estado.save
    respond_to do |format|
      format.html { redirect_to estados_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado
      @estado = Estado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_params
      params.require(:estado).permit(:descripcion, :estatus, :pais_id)
    end
end
