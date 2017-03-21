class FormacionAcademicasController < ApplicationController
  before_action :set_formacion_academica, only: [:show, :edit, :update, :destroy]

  # GET /formacion_academicas
  # GET /formacion_academicas.json
  def index
    @parametros = FormacionAcademica.where(:estatus => 1)
    
    respond_to do |format|
      format.html {  render "parametros_select/index" }
      format.json { render json: @parametros }
    end
  end

  # GET /formacion_academicas/1
  # GET /formacion_academicas/1.json
  def show
    @parametro = FormacionAcademica.find(params[:id])

    render "parametros_select/edit"
  end

  # GET /formacion_academicas/new
  def new
    @parametro = FormacionAcademica.new
    @collection = NivelFormacion.where(:estatus => 1)
    @referencia = :nivel_formacion_id

    render "parametros_select/new"
  end

  # GET /formacion_academicas/1/edit
  def edit
    @parametro = FormacionAcademica.find(params[:id])
    @collection = NivelFormacion.where(:estatus => 1)
    @referencia = :nivel_formacion_id

    render "parametros_select/edit"
  end

  # POST /formacion_academicas
  # POST /formacion_academicas.json
  def create
    @formacion_academica = FormacionAcademica.new(formacion_academica_params)

    respond_to do |format|
      if @formacion_academica.save
        format.html { redirect_to formacion_academicas_path, notice: 'El registro ha sido creado exitosamente' }
        format.json { render :show, status: :created, location: @formacion_academica }
      else
        format.html { render :new }
        format.json { render json: @formacion_academica.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formacion_academicas/1
  # PATCH/PUT /formacion_academicas/1.json
  def update
    respond_to do |format|
      if @formacion_academica.update(formacion_academica_params)
        format.html { redirect_to formacion_academicas_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @formacion_academica }
      else
        format.html { render :edit }
        format.json { render json: @formacion_academica.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formacion_academicas/1
  # DELETE /formacion_academicas/1.json
  def destroy
    @formacion_academica.estatus = 2
    @formacion_academica.save
    respond_to do |format|
      format.html { redirect_to formacion_academicas_path, alert: 'El registro ha sido eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formacion_academica
      @formacion_academica = FormacionAcademica.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formacion_academica_params
      params.require(:formacion_academica).permit(:descripcion, :estatus, :nivel_formacion_id)
    end
end
