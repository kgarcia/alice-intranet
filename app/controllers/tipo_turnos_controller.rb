class TipoTurnosController < ApplicationController
  before_action :set_tipo_turno, only: [:show, :edit, :update, :destroy]

  # GET /tipo_turnos
  # GET /tipo_turnos.json
  def index
      @parametros = TipoTurno.where(:estatus => 1)

    render "parametros/index"
  end

  # GET /tipo_turnos/1
  # GET /tipo_turnos/1.json
  def show
    @parametro = TipoTurno.find(params[:id])

    render "parametros/edit"
  end

  # GET /tipo_turnos/new
  def new
    @parametro = TipoTurno.new

    render "parametros/new"

  end

  # GET /tipo_turnos/1/edit
  def edit
     @parametro = TipoTurno.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_turnos
  # POST /tipo_turnos.json
  def create
    @tipo_turno = TipoTurno.new(tipo_turno_params)

    respond_to do |format|
      if @tipo_turno.save
        format.html { redirect_to tipo_turnos_path, notice: 'El registro ha sido creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_turno }
      else
        format.html { render :new }
        format.json { render json: @tipo_turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_turnos/1
  # PATCH/PUT /tipo_turnos/1.json
  def update
    respond_to do |format|
      if @tipo_turno.update(tipo_turno_params)
        format.html { redirect_to  tipo_turnos_path, info: 'El registro ha sido actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_turno }
      else
        format.html { render :edit }
        format.json { render json: @tipo_turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_turnos/1
  # DELETE /tipo_turnos/1.json
  def destroy
    @tipo_turno.estatus = 2
    @tipo_turno.save
    respond_to do |format|
      format.html { redirect_to  tipo_turnos_path, alert: 'El registro ha sido eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_turno
      @tipo_turno = TipoTurno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_turno_params
      params.require(:tipo_turno).permit(:descripcion)
    end
end
