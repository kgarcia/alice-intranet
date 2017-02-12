class CirugiasController < ApplicationController
  before_action :set_cirugia, only: [:show, :edit, :update, :destroy]

  # GET /cirugias
  # GET /cirugias.json
  def index
    @cirugias = Cirugia.all
  end

  # GET /cirugias/1
  # GET /cirugias/1.json
  def show
  end

  # GET /cirugias/new
  def new
    @cirugia = Cirugia.new
  end

  # GET /cirugias/1/edit
  def edit
  end

  # POST /cirugias
  # POST /cirugias.json
  def create
    @cirugia = Cirugia.new(cirugia_params)

    respond_to do |format|
      if @cirugia.save
        format.html { redirect_to @cirugia, notice: 'Cirugia was successfully created.' }
        format.json { render :show, status: :created, location: @cirugia }
      else
        format.html { render :new }
        format.json { render json: @cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cirugias/1
  # PATCH/PUT /cirugias/1.json
  def update
    respond_to do |format|
      if @cirugia.update(cirugia_params)
        format.html { redirect_to @cirugia, notice: 'Cirugia was successfully updated.' }
        format.json { render :show, status: :ok, location: @cirugia }
      else
        format.html { render :edit }
        format.json { render json: @cirugia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cirugias/1
  # DELETE /cirugias/1.json
  def destroy
    @cirugia.destroy
    respond_to do |format|
      format.html { redirect_to cirugias_url, notice: 'Cirugia was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cirugia
      @cirugia = Cirugia.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cirugia_params
      params.require(:cirugia).permit(:descripcion, :estatus, :TipoCirugia_id)
    end
end
