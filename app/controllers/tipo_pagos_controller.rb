class TipoPagosController < ApplicationController
  before_action :set_tipo_pago, only: [:show, :edit, :update, :destroy]

  # GET /tipo_pagos
  # GET /tipo_pagos.json
  def index
    @parametros = TipoPago.all

    render "parametros/index"
  end

  # GET /tipo_pagos/1
  # GET /tipo_pagos/1.json
  def show
    @parametro = TipoPago.find(params[:id])

    render "parametros/show"
  end

  # GET /tipo_pagos/new
  def new
    @parametro = TipoPago.new

    render "parametros/new"
  end

  # GET /tipo_pagos/1/edit
  def edit
    @parametro = TipoPago.find(params[:id])

    render "parametros/edit"
  end

  # POST /tipo_pagos
  # POST /tipo_pagos.json
  def create
    @tipo_pago = TipoPago.new(tipo_pago_params)

    respond_to do |format|
      if @tipo_pago.save
        format.html { redirect_to @tipo_pago, notice: 'Tipo pago was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_pago }
      else
        format.html { render :new }
        format.json { render json: @tipo_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_pagos/1
  # PATCH/PUT /tipo_pagos/1.json
  def update
    respond_to do |format|
      if @tipo_pago.update(tipo_pago_params)
        format.html { redirect_to @tipo_pago, notice: 'Tipo pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_pago }
      else
        format.html { render :edit }
        format.json { render json: @tipo_pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_pagos/1
  # DELETE /tipo_pagos/1.json
  def destroy
    @tipo_pago.destroy
    respond_to do |format|
      format.html { redirect_to tipo_pagos_url, notice: 'Tipo pago was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_pago
      @tipo_pago = TipoPago.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_pago_params
      params.require(:tipo_pago).permit(:descripcion, :estatus)
    end
end
