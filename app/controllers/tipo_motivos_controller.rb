class TipoMotivosController < ApplicationController
  before_action :set_tipo_motivo, only: [:show, :edit, :update, :destroy]

  # GET /tipo_motivos
  # GET /tipo_motivos.json

  def index
    @parametros = TipoMotivo.all

    render "parametros/index"
  end


  # GET /tipo_motivos/1
  # GET /tipo_motivos/1.json
  def show

    @parametro = TipoMotivo.find(params[:id])

    render "parametros/edit"
  end


  # GET /tipo_motivos/new
  def new
    @parametro = TipoMotivo.new

    render "parametros/new"
  end


  # GET /tipo_motivos/1/edit
  def edit
    @parametro = TipoMotivo.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_motivos
  # POST /tipo_motivos.json
  def create
    @tipo_motivo = TipoMotivo.new(tipo_motivo_params)

    respond_to do |format|
      if @tipo_motivo.save
        format.html { redirect_to action:"index", notice: 'Tipo motivo was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_motivo }
      else
        format.html { render :new }
        format.json { render json: @tipo_motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_motivos/1
  # PATCH/PUT /tipo_motivos/1.json
  def update
    respond_to do |format|
      if @tipo_motivo.update(tipo_motivo_params)
        format.html { redirect_to action:"index", notice: 'Tipo motivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_motivo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_motivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_motivos/1
  # DELETE /tipo_motivos/1.json
  def destroy
    @tipo_motivo.destroy
    respond_to do |format|
      format.html { redirect_to tipo_motivos_url, notice: 'Tipo motivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_motivo
      @tipo_motivo = TipoMotivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_motivo_params
      params.require(:tipo_motivo).permit(:descripcion, :estatus)
    end
end
