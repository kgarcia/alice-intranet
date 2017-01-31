class SexosController < ApplicationController
  before_action :set_sexo, only: [:show, :edit, :update, :destroy]

  # GET /sexos
  # GET /sexos.json
  def index
    @sexos = Sexo.all
  end

  # GET /sexos/1
  # GET /sexos/1.json
  def show
  end

  # GET /sexos/new
  def new
    @sexo = Sexo.new
  end

  # GET /sexos/1/edit
  def edit
  end

  # POST /sexos
  # POST /sexos.json
  def create
    @sexo = Sexo.new(sexo_params)

    respond_to do |format|
      if @sexo.save
        format.html { redirect_to @sexo, notice: 'Sexo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sexo }
      else
        format.html { render action: 'new' }
        format.json { render json: @sexo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sexos/1
  # PATCH/PUT /sexos/1.json
  def update
    respond_to do |format|
      if @sexo.update(sexo_params)
        format.html { redirect_to @sexo, notice: 'Sexo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sexo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sexos/1
  # DELETE /sexos/1.json
  def destroy
    @sexo.destroy
    respond_to do |format|
      format.html { redirect_to sexos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sexo
      @sexo = Sexo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sexo_params
      params.require(:sexo).permit(:descripcion,:estatus)
    end
end
