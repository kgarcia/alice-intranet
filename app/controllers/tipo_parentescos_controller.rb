class TipoParentescosController < ApplicationController
  before_action :set_tipo_parentesco, only: [:show, :edit, :update, :destroy]

  # GET /tipo_parentescos
  # GET /tipo_parentescos.json
  def index
    @parametros = TipoParentesco.where(:estatus => 1)
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_parentescos/1
  # GET /tipo_parentescos/1.json
  def show
    @parametro = TipoParentesco.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_parentescos/new
  def new
    @parametro = TipoParentesco.new
    render "parametros/new"
  end

  # GET /tipo_parentescos/1/edit
  def edit
    @parametro = TipoParentesco.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_parentescos
  # POST /tipo_parentescos.json
  def create
    @tipo_parentesco = TipoParentesco.new(tipo_parentesco_params)

    respond_to do |format|
      if @tipo_parentesco.save
        format.html { redirect_to tipo_parentescos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_parentesco }
      else
        format.html { render :new }
        format.json { render json: @tipo_parentesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_parentescos/1
  # PATCH/PUT /tipo_parentescos/1.json
  def update
    respond_to do |format|
      if @tipo_parentesco.update(tipo_parentesco_params)
        format.html { redirect_to tipo_parentescos_path, info: 'El registro ha sido actualizado exitosamente.'  }
        format.json { render :show, status: :ok, location: @tipo_parentesco }
      else
        format.html { render :edit }
        format.json { render json: @tipo_parentesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_parentescos/1
  # DELETE /tipo_parentescos/1.json
  def destroy
    @tipo_parentesco.estatus = 2
    @tipo_parentesco.save
    respond_to do |format|
      format.html { redirect_to tipo_parentescos_path, alert: 'El registro ha sido eliminado exitosamente.'  }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_parentesco
      @tipo_parentesco = TipoParentesco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_parentesco_params
      params.require(:tipo_parentesco).permit(:descripcion, :estatus)
    end
end
