class PreguntasController < ApplicationController
  before_action :set_pregunta, only: [:show, :edit, :update, :destroy]

  # GET /preguntas
  # GET /preguntas.json
  def index
    @preguntas = Pregunta.where(:estatus => 1)
   # render "preguntas/index"
  end

  # GET /preguntas/1
  # GET /preguntas/1.json
  def show
    @tipoPreguntas = TipoPregunta.where(:estatus => 1)
    render 'edit'
  end

  # GET /preguntas/new
  def new
    @pregunta = Pregunta.new
    @tipoPreguntas = TipoPregunta.where(:estatus => 1)
  end

  # GET /preguntas/1/edit
  def edit
    @tipoPreguntas = TipoPregunta.where(:estatus => 1)
  end

  # POST /preguntas
  # POST /preguntas.json
  def create
    @pregunta = Pregunta.new(pregunta_params)

    respond_to do |format|
      if @pregunta.save
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully created.' }
        format.json { render :show, status: :created, location: @pregunta }
      else
        format.html { render :new }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preguntas/1
  # PATCH/PUT /preguntas/1.json
  def update
    respond_to do |format|
      if @pregunta.update(pregunta_params)
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully updated.' }
        format.json { render :show, status: :ok, location: @pregunta }
      else
        format.html { render :edit }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preguntas/1
  # DELETE /preguntas/1.json
  def destroy
    @pregunta.estatus = 2
    @pregunta.save
    respond_to do |format|
      format.html { redirect_to preguntas_url, notice: 'Pregunta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pregunta
      @pregunta = Pregunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pregunta_params
      params.require(:pregunta).permit(:descripcion, :respuesta, :tipo_pregunta_id, :estatus)
    end
end
