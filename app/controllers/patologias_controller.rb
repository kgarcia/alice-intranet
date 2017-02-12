class PatologiasController < ApplicationController
  before_action :set_patologia, only: [:show, :edit, :update, :destroy]

  # GET /patologias
  # GET /patologias.json
  def index
    @patologias = Patologia.all
  end

  # GET /patologias/1
  # GET /patologias/1.json
  def show
  end

  # GET /patologias/new
  def new
    @patologia = Patologia.new
  end

  # GET /patologias/1/edit
  def edit
  end

  # POST /patologias
  # POST /patologias.json
  def create
    @patologia = Patologia.new(patologia_params)

    respond_to do |format|
      if @patologia.save
        format.html { redirect_to @patologia, notice: 'Patologia was successfully created.' }
        format.json { render :show, status: :created, location: @patologia }
      else
        format.html { render :new }
        format.json { render json: @patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patologias/1
  # PATCH/PUT /patologias/1.json
  def update
    respond_to do |format|
      if @patologia.update(patologia_params)
        format.html { redirect_to @patologia, notice: 'Patologia was successfully updated.' }
        format.json { render :show, status: :ok, location: @patologia }
      else
        format.html { render :edit }
        format.json { render json: @patologia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patologias/1
  # DELETE /patologias/1.json
  def destroy
    @patologia.destroy
    respond_to do |format|
      format.html { redirect_to patologias_url, notice: 'Patologia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patologia
      @patologia = Patologia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patologia_params
      params.require(:patologia).permit(:descripcion, :estatus, :TipoPatologia_id)
    end
end
