class TipoOpinionesController < ApplicationController
before_action :set_tipo_opinion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_opiniones
  # GET /tipo_opiniones.json
  def index
    @parametros = TipoOpinion.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_opiniones/1
  # GET /tipo_opiniones/1.json
  def show
    @parametro = TipoOpinion.find(params[:id])

    render "parametros/show"
  end

  # GET /tipo_opiniones/new
  def new
    @parametro = TipoOpinion.new

    render "parametros/new"
  end

  # GET /tipo_opiniones/1/edit
  def edit
    @parametro = TipoOpinion.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_opiniones
  # POST /tipo_opiniones.json
  def create
    @tipo_opinion = TipoOpinion.new(tipo_opinion_params)

    respond_to do |format|
      if @tipo_opinion.save
        format.html { redirect_to tipo_opiniones_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_opinion }
      else
        format.html { render :new }
        format.json { render json: @tipo_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_opiniones/1
  # PATCH/PUT /tipo_opiniones/1.json
  def update
    respond_to do |format|
      if @tipo_opinion.update(tipo_opinion_params)
        format.html { redirect_to tipo_opiniones_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_opinion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_opiniones/1
  # DELETE /tipo_opiniones/1.json
  def destroy
    @tipo_opinion.estatus = 2
    @tipo_opinion.save
    respond_to do |format|
      format.html { redirect_to tipo_opiniones_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_opinion
      @tipo_opinion = TipoOpinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_opinion_params
      params.require(:tipo_opinion).permit(:descripcion, :estatus)
    end
end