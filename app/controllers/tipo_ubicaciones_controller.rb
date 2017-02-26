class TipoUbicacionesController < ApplicationController
  before_action :set_tipo_ubicacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_ubicaciones
  # GET /tipo_ubicaciones.json
  def index
    @parametros = TipoUbicacion.all
    
    render "parametros/index"
  end

  # GET /tipo_ubicaciones/1
  # GET /tipo_ubicaciones/1.json
  def show
    @parametro = TipoUbicacion.find(params[:id])
<<<<<<< HEAD
=======

    render "parametros/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /tipo_ubicaciones/new
  def new
<<<<<<< HEAD
    @tipo_ubicacion = TipoUbicacion.new
=======
    @parametro = TipoUbicacion.new

    render "parametros/new"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # GET /tipo_ubicaciones/1/edit
  def edit
    @parametro = TipoUbicacion.find(params[:id])
<<<<<<< HEAD
=======

    render "parametros/edit"
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
  end

  # POST /tipo_ubicaciones
  # POST /tipo_ubicaciones.json
  def create
    @tipo_ubicacion = TipoUbicacion.new(tipo_ubicacion_params)

    respond_to do |format|
      if @tipo_ubicacion.save
<<<<<<< HEAD
        format.html { redirect_to @tipo_ubicacion, notice: 'Tipo ubicacion was successfully created.' }
=======
        format.html { redirect_to edit_tipo_ubicacion_path(@tipo_ubicacion), notice: 'Tipo ubicacion was successfully created.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :created, location: @tipo_ubicacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_ubicaciones/1
  # PATCH/PUT /tipo_ubicaciones/1.json
  def update
    respond_to do |format|
      if @tipo_ubicacion.update(tipo_ubicacion_params)
<<<<<<< HEAD
        format.html { redirect_to @tipo_ubicacion, notice: 'Tipo ubicacion was successfully updated.' }
=======
        format.html { redirect_to edit_tipo_ubicacion_path(@tipo_ubicacion), notice: 'Tipo ubicacion was successfully updated.' }
>>>>>>> 46d78a09a6d73b42ea989e8ff32ab2bd3293e157
        format.json { render :show, status: :ok, location: @tipo_ubicacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_ubicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_ubicaciones/1
  # DELETE /tipo_ubicaciones/1.json
  def destroy
    @tipo_ubicacion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_ubicaciones_url, notice: 'Tipo ubicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_ubicacion
      @tipo_ubicacion = TipoUbicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_ubicacion_params
      params.require(:tipo_ubicacion).permit(:descripcion, :estatus)
    end
end
