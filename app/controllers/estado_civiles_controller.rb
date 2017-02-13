class EstadoCivilesController < ApplicationController
  before_action :set_estado_civil, only: [:show, :edit, :update, :destroy]

  # GET /estado_civiles
  # GET /estado_civiles.json
  def index
    @estado_civiles = EstadoCivil.all
  end

  # GET /estado_civiles/1
  # GET /estado_civiles/1.json
  def show
  end

  # GET /estado_civiles/new
  def new
    @estado_civil = EstadoCivil.new
  end

  # GET /estado_civiles/1/edit
  def edit
  end

  # POST /estado_civiles
  # POST /estado_civiles.json
  def create
    @estado_civil = EstadoCivil.new(estado_civil_params)

    respond_to do |format|
      if @estado_civil.save
        format.html { redirect_to @estado_civil, notice: 'Estado civil was successfully created.' }
        format.json { render :show, status: :created, location: @estado_civil }
      else
        format.html { render :new }
        format.json { render json: @estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estado_civiles/1
  # PATCH/PUT /estado_civiles/1.json
  def update
    respond_to do |format|
      if @estado_civil.update(estado_civil_params)
        format.html { redirect_to @estado_civil, notice: 'Estado civil was successfully updated.' }
        format.json { render :show, status: :ok, location: @estado_civil }
      else
        format.html { render :edit }
        format.json { render json: @estado_civil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estado_civiles/1
  # DELETE /estado_civiles/1.json
  def destroy
    @estado_civil.destroy
    respond_to do |format|
      format.html { redirect_to estado_civiles_url, notice: 'Estado civil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estado_civil
      @estado_civil = EstadoCivil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estado_civil_params
      params.require(:estado_civil).permit(:descripcion, :estatus)
    end
end
