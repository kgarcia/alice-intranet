class HabitosController < ApplicationController
  before_action :set_habito, only: [:show, :edit, :update, :destroy]

  # GET /habitos
  # GET /habitos.json
  def index
    @parametros = Habito.all

    render "parametros/index"
  end

  # GET /habitos/1
  # GET /habitos/1.json
  def show
    @parametro = Habito.find(params[:id])
    render "parametros/show"
  end

  # GET /habitos/new
  def new
    @parametro = Habito.new

    render "parametros/new"
  end

  # GET /habitos/1/edit
  def edit
    @parametro = Habito.find(params[:id])
    render "parametros/edit"
  end

  # POST /habitos
  # POST /habitos.json
  def create
    @habito = Habito.new(habito_params)

    respond_to do |format|
      if @habito.save
        format.html { redirect_to @habito, notice: 'Habito was successfully created.' }
        format.json { render action: 'show', status: :created, location: @habito }
      else
        format.html { render action: 'new' }
        format.json { render json: @habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habitos/1
  # PATCH/PUT /habitos/1.json
  def update
    respond_to do |format|
      if @habito.update(habito_params)
        format.html { redirect_to @habito, notice: 'Habito was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @habito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habitos/1
  # DELETE /habitos/1.json
  def destroy
    @habito.destroy
    respond_to do |format|
      format.html { redirect_to habitos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habito
      @habito = Habito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habito_params
      params.require(:habito).permit(:descripcion, :estatus)
    end
end
