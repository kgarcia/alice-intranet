class CitasController < ApplicationController
  before_action :set_cita, only: [:show, :edit, :update, :destroy]

  # GET /citas
  # GET /citas.json
  def index
    @citas = Cita.all
    @lista = Cita.joins(turno:[horario:[:servicio]])
  end

  # GET /citas/1
  # GET /citas/1.json
  def show
  end

  # GET /citas/new
  def new
    @cita = Cita.new
  end

  # GET /citas/1/edit
  def edit
  end

  # POST /citas
  # POST /citas.json
  def create
    @cita = Cita.new(cita_params)

    respond_to do |format|
      if @cita.save
        ExampleMailer.cita_registrada.deliver_now#('kevin93ps@gmail.com', @cita)
        format.html { redirect_to @cita, notice: 'Cita was successfully created.' }
        format.json { render :show, status: :created, location: @cita }
      else
        format.html { render :new }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citas/1
  # PATCH/PUT /citas/1.json
  def update
    respond_to do |format|
      if @cita.update(cita_params)
        format.html { redirect_to @cita, notice: 'Cita was successfully updated.' }
        format.json { render :show, status: :ok, location: @cita }
      else
        format.html { render :edit }
        format.json { render json: @cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citas/1
  # DELETE /citas/1.json
  def destroy
    @cita.destroy
    respond_to do |format|
      format.html { redirect_to citas_url, notice: 'Cita was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancelar
    @citas = Cita.all
  end

  def cancelar2
    @cita = Cita.find(params[:id])
    @cita.estatus = 4
    @cita.save
    redirect_to citas_url
  end

  def chequear
    @citas = Cita.all
  end

  def chequear2
    @cita = Cita.find(params[:id])
    @cita.estatus = 6
    @cita.save
    redirect_to citas_url
  end

  def finalizar
    @citas = Cita.all
  end

  def finalizar2
    @cita = Cita.find(params[:id])
    @cita.estatus = 7
    @cita.save
    redirect_to citas_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cita
      @cita = Cita.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cita_params
      params.require(:cita).permit(:turno_id, :persona_id, :usuario_id, :fecha, :tipo_pago_id, :tipo_cita_id, :eventualidad_id, :estatus)
    end
end
