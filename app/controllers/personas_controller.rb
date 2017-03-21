class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  # GET /personas
  # GET /personas.json
  def index
    @personas = Persona.all

    respond_to do |format|
      format.html { render "personas/index" }
      format.json { render json: @personas }
    end
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
    @persona = Persona.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @persona }
    end
  end

  # GET /personas/new
  def new
    @persona = Persona.new
    @sexos = Sexo.all
  end

  # GET /personas/1/edit
  def edit
    @sexos = Sexo.all
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to personas_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to personas_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to personas_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:cedula, :nombre, :apellido, :telefono, :direccion, :fecha_nacimiento, :sexo_id, :edad, :peso, :altura)
    end
end
