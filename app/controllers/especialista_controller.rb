class EspecialistaController < ApplicationController
  before_action :set_especialistum, only: [:show, :edit, :update, :destroy]

  # GET /especialista
  # GET /especialista.json
  def index
    @especialista = Especialistum.all
  end

  # GET /especialista/1
  # GET /especialista/1.json
  def show
  end

  # GET /especialista/new
  def new
    @especialistum = Especialistum.new
  end

  # GET /especialista/1/edit
  def edit
  end

  # POST /especialista
  # POST /especialista.json
  def create
    @especialistum = Especialistum.new(especialistum_params)

    respond_to do |format|
      if @especialistum.save
        format.html { redirect_to @especialistum, notice: 'Especialistum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @especialistum }
      else
        format.html { render action: 'new' }
        format.json { render json: @especialistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /especialista/1
  # PATCH/PUT /especialista/1.json
  def update
    respond_to do |format|
      if @especialistum.update(especialistum_params)
        format.html { redirect_to @especialistum, notice: 'Especialistum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @especialistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /especialista/1
  # DELETE /especialista/1.json
  def destroy
    @especialistum.destroy
    respond_to do |format|
      format.html { redirect_to especialista_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_especialistum
      @especialistum = Especialistum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def especialistum_params
      params.require(:especialistum).permit(:cedula, :nombre, :apellido, :especialidad_id, :fecha_ingreso, :sexo_id, :curriculum, :edad)
    end
end
