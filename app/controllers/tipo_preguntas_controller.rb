class TipoPreguntasController < ApplicationController
before_action :set_tipo_pregunta, only: [:show, :edit, :update, :destroy]

  # GET /tipo_preguntaes
  # GET /tipo_preguntaes.json
  def index
    @parametros = TipoPregunta.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_preguntaes/1
  # GET /tipo_preguntaes/1.json
  def show
    @parametro = TipoPregunta.find(params[:id])

    render "parametros/show"
  end

  # GET /tipo_preguntaes/new
  def new
    @parametro = TipoPregunta.new

    render "parametros/new"
  end

  # GET /tipo_preguntaes/1/edit
  def edit
    @parametro = TipoPregunta.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_preguntaes
  # POST /tipo_preguntaes.json
  def create
    @tipo_pregunta = TipoPregunta.new(tipo_pregunta_params)

    respond_to do |format|
      if @tipo_pregunta.save
        format.html { redirect_to tipo_preguntas_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_pregunta }
      else
        format.html { render :new }
        format.json { render json: @tipo_pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_preguntaes/1
  # PATCH/PUT /tipo_preguntaes/1.json
  def update
    respond_to do |format|
      if @tipo_pregunta.update(tipo_pregunta_params)
        format.html { redirect_to tipo_preguntas_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_pregunta }
      else
        format.html { render :edit }
        format.json { render json: @tipo_pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_preguntaes/1
  # DELETE /tipo_preguntaes/1.json
  def destroy
    @tipo_pregunta.estatus = 2
    @tipo_pregunta.save
    respond_to do |format|
      format.html { redirect_to tipo_preguntas_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_pregunta
      @tipo_pregunta = TipoPregunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_pregunta_params
      params.require(:tipo_pregunta).permit(:descripcion, :estatus)
    end
end