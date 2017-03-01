class ParentescosController < ApplicationController
  before_action :set_parentesco, only: [:show, :edit, :update, :destroy]

  # GET /parentescos
  # GET /parentescos.json
  def index
    @parentescos = Parentesco.all
  end

  # GET /parentescos/1
  # GET /parentescos/1.json
  def show
  end

  # GET /parentescos/new
  def new
    @parentesco = Parentesco.new
  end

  # GET /parentescos/1/edit
  def edit
  end

  # POST /parentescos
  # POST /parentescos.json
  def create
    @parentesco = Parentesco.new(parentesco_params)

    respond_to do |format|
      if @parentesco.save
        format.html { redirect_to @parentesco, notice: 'Parentesco was successfully created.' }
        format.json { render :show, status: :created, location: @parentesco }
      else
        format.html { render :new }
        format.json { render json: @parentesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parentescos/1
  # PATCH/PUT /parentescos/1.json
  def update
    respond_to do |format|
      if @parentesco.update(parentesco_params)
        format.html { redirect_to @parentesco, notice: 'Parentesco was successfully updated.' }
        format.json { render :show, status: :ok, location: @parentesco }
      else
        format.html { render :edit }
        format.json { render json: @parentesco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parentescos/1
  # DELETE /parentescos/1.json
  def destroy
    @parentesco.destroy
    respond_to do |format|
      format.html { redirect_to parentescos_url, notice: 'Parentesco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parentesco
      @parentesco = Parentesco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parentesco_params
      params.require(:parentesco).permit(:descripcion, :persona_id, :pariente_id, :tipo_parentesco_id, :estatus)
    end
end
