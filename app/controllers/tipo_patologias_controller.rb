class TipoPatologiasController < ApplicationController
  before_action :set_tipo_patologia, only: [:show, :edit, :update, :destroy]

  # GET /tipo_patologias
  # GET /tipo_patologias.json
  def index
    @parametros = TipoPatologia.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_patologias/1
  # GET /tipo_patologias/1.json
  def show
    @parametro = TipoPatologia.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_patologias/new
  def new
    @parametro = TipoPatologia.new
    render "parametros/new"
  end

  # GET /tipo_patologias/1/edit
  def edit
    @parametro = TipoPatologia.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_patologias
  # POST /tipo_patologias.json
  def create
    @tipo_patologia = TipoPatologia.new(tipo_patologia_params)

    respond_to do |format|
      if @tipo_patologia.save
        format.html { redirect_to tipo_patologias_path, notice: 'El registro ha sido creado exitosamente.'  }
        format.json { render :show, status: :created, location: @tipo_patologia }
      else
        format.html { render :new }
        format.json { render json: @tipo_patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_patologias/1
  # PATCH/PUT /tipo_patologias/1.json
  def update
    respond_to do |format|
      if @tipo_patologia.update(tipo_patologia_params)
        format.html { redirect_to tipo_patologias_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_patologia }
      else
        format.html { render :edit }
        format.json { render json: @tipo_patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_patologias/1
  # DELETE /tipo_patologias/1.json
  def destroy
    @tipo_patologia.estatus = 2
    @tipo_patologia.save
    respond_to do |format|
      format.html { redirect_to tipo_patologias_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_patologia
      @tipo_patologia = TipoPatologia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_patologia_params
      params.require(:tipo_patologia).permit(:descripcion, :estatus)
    end
end
