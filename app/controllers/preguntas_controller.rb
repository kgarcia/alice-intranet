class PreguntasController < ApplicationController
  before_action :set_pregunta, only: [:show, :edit, :update, :destroy]

  # GET /pregunta
  # GET /pregunta.json
  def index
    @parametros = Pregunta.all

    render "parametros/index"
  end

  # GET /pregunta/1
  # GET /pregunta/1.json
  def show
    @parametro = Pregunta.find(params[:id])

    render "parametros/show"
  end

  # GET /pregunta/new
  def new
    @parametro = Pregunta.new
    @sexos = Sexo.all
    render "parametros/new"
  end

  # GET /pregunta/1/edit
  def edit
    @parametro = Pregunta.find(params[:id])
    
    render "parametros/edit"
  end

  # POST /pregunta
  # POST /pregunta.json
  def create
    @pregunta = Pregunta.new(pregunta_params)

    respond_to do |format|
      if @pregunta.save
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pregunta }
      else
        format.html { render action: 'new' }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pregunta/1
  # PATCH/PUT /pregunta/1.json
  def update
    respond_to do |format|
      if @pregunta.update(pregunta_params)
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pregunta/1
  # DELETE /pregunta/1.json
  def destroy
    @pregunta.destroy
    respond_to do |format|
      format.html { redirect_to pregunta_url }
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
      params.require(:pregunta).permit(:descripcion, :estatus)
    end
end
