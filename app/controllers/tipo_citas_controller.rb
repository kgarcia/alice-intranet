class TipoCitasController < ApplicationController
  before_action :set_tipo_cita, only: [:show, :edit, :update, :destroy]

  # GET /tipo_citas
  # GET /tipo_citas.json
  def index
    @parametros = TipoCita.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /tipo_citas/1
  # GET /tipo_citas/1.json
  def show
    @parametro = TipoCita.find(params[:id])
    respond_to do |format|
      format.html {  render "parametros/edit" }
      format.json { render json: @parametro }
    end
  end

  # GET /tipo_citas/new
  def new
    @parametro = TipoCita.new

    render "parametros/new"
  end

  # GET /tipo_citas/1/edit
  def edit
    @parametro = TipoCita.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_citas
  # POST /tipo_citas.json
  def create
    @tipo_cita = TipoCita.new(tipo_cita_params)
    @tipo_cita.estatus = 1
    respond_to do |format|
      if @tipo_cita.save
        format.html { redirect_to tipo_citas_path, notice: 'El registro fue creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_cita }
      else
        format.html { render :new }
        format.json { render json: @tipo_cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_citas/1
  # PATCH/PUT /tipo_citas/1.json
  def update
    respond_to do |format|
      if @tipo_cita.update(tipo_cita_params)
        format.html { redirect_to edit_tipo_cita_path(@tipo_cita), notice: 'El registro fue actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_cita }
      else
        format.html { render :edit }
        format.json { render json: @tipo_cita.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_citas/1
  # DELETE /tipo_citas/1.json
  def destroy
    @tipo_cita.estatus = 2
    @tipo_cita.save
    respond_to do |format|
      format.html { redirect_to tipo_citas_url, notice: 'El registro fue elimando exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_cita
      @tipo_cita = TipoCita.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_cita_params
      params.require(:tipo_cita).permit(:descripcion, :estatus)
    end
end
