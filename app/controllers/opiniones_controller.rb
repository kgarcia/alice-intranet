class OpinionesController < ApplicationController
  before_action :set_opinion, only: [:show, :edit, :update, :destroy]

  # GET /opiniones
  # GET /opiniones.json
  def index
    @opiniones = Opinion.where(:estatus => 1)
  end

  # GET /opiniones/1
  # GET /opiniones/1.json
  def show
  end

  # GET /opiniones/new
  def new
    @opinion = Opinion.new
    @tipoOpiniones = TipoOpinion.where(:estatus => 1)
  end

  # GET /opiniones/1/edit
  def edit
    @tipoOpiniones = TipoOpinion.where(:estatus => 1)
  end

  # POST /opiniones
  # POST /opiniones.json
  def create
    @opinion = Opinion.new(opinion_params)

    respond_to do |format|
      if @opinion.save
        format.html { redirect_to @opinion, notice: 'Opinion was successfully created.' }
        format.json { render :show, status: :created, location: @opinion }
      else
        format.html { render :new }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opiniones/1
  # PATCH/PUT /opiniones/1.json
  def update
    respond_to do |format|
      if @opinion.update(opinion_params)
        format.html { redirect_to @opinion, notice: 'Opinion was successfully updated.' }
        format.json { render :show, status: :ok, location: @opinion }
      else
        format.html { render :edit }
        format.json { render json: @opinion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opiniones/1
  # DELETE /opiniones/1.json
  def destroy
    @opinion.estatus = 2
    @opinion.save
    respond_to do |format|
      format.html { redirect_to opiniones_url, notice: 'Opinion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_opinion
      @opinion = Opinion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opinion_params
      params.require(:opinion).permit(:correo, :nombre, :descripcion, :tipo_opinion_id, :estatus)
    end
end
