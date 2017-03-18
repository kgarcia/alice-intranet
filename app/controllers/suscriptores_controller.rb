class SuscriptoresController < ApplicationController
  before_action :set_suscriptor, only: [:show, :edit, :update, :destroy]

  # GET /suscriptores
  # GET /suscriptores.json
  def index
    @suscriptores = Suscriptor.all
  end

  # GET /suscriptores/1
  # GET /suscriptores/1.json
  def show
  end

  # GET /suscriptores/new
  def new
    @suscriptor = Suscriptor.new
  end

  # GET /suscriptores/1/edit
  def edit
  end

  # POST /suscriptores
  # POST /suscriptores.json
  def create
    @suscriptor = Suscriptor.new(suscriptor_params)
    #@persona = Persona.new(persona_params)
    #@persona.save
    #@suscriptor.persona_id = 5
    respond_to do |format|
      if @suscriptor.save
        format.html { redirect_to @suscriptor, notice: 'Suscriptor was successfully created.' }
        format.json { render :show, status: :created, location: @suscriptor }
      else
        format.html { render :new }
        format.json { render json: @suscriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suscriptores/1
  # PATCH/PUT /suscriptores/1.json
  def update
    respond_to do |format|
      if @suscriptor.update(suscriptor_params)
        format.html { redirect_to @suscriptor, notice: 'Suscriptor was successfully updated.' }
        format.json { render :show, status: :ok, location: @suscriptor }
      else
        format.html { render :edit }
        format.json { render json: @suscriptor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suscriptores/1
  # DELETE /suscriptores/1.json
  def destroy
    @suscriptor.destroy
    respond_to do |format|
      format.html { redirect_to suscriptores_url, notice: 'Suscriptor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suscriptor
      @suscriptor = Suscriptor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suscriptor_params
      params.require(:suscriptor).permit(:email, :persona_id, :estatus)
    end

   # def persona_params
    #  params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento,:sexo_id)
    #end
end
