class EstadosController < ApplicationController
  before_action :set_estado, only: [:show, :edit, :update, :destroy]

  # GET /estados
  # GET /estados.json
  def index
    @parametros = Estado.all
    render "parametros_select/index"
  end

  # GET /estados/1
  # GET /estados/1.json
  def show
    @parametro = Estado.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /estados/new
  def new
    @parametro = Estado.new
    @collection = Pais.all
    @referencia = :pais_id

    render "parametros_select/new"
  end

  # GET /estados/1/edit
  def edit
    @parametro = Estado.find(params[:id])

    render "parametros_select/edit"
  end

  # POST /estados
  # POST /estados.json
  def create
    @estado = Estado.new(estado_params)

    respond_to do |format|
      if @estado.save
        format.html { redirect_to edit_estado_path(@estado), notice: 'Estado was successfully created.' }
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
        format.html { redirect_to edit_estado_path(@estado), notice: 'Estado was successfully updated.' }
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
    @estado.destroy
    respond_to do |format|
      format.html { redirect_to estados_url, notice: 'Estado was successfully destroyed.' }
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
