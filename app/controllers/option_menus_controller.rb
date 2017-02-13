class OptionMenusController < ApplicationController
  before_action :set_option_menu, only: [:show, :edit, :update, :destroy]

  # GET /option_menus
  # GET /option_menus.json
  def index
    @option_menus = OptionMenu.all
  end

  # GET /option_menus/1
  # GET /option_menus/1.json
  def show
  end

  # GET /option_menus/new
  def new
    @option_menu = OptionMenu.new
  end

  # GET /option_menus/1/edit
  def edit
  end

  # POST /option_menus
  # POST /option_menus.json
  def create
    @option_menu = OptionMenu.new(option_menu_params)

    respond_to do |format|
      if @option_menu.save
        format.html { redirect_to @option_menu, notice: 'Option menu was successfully created.' }
        format.json { render action: 'show', status: :created, location: @option_menu }
      else
        format.html { render action: 'new' }
        format.json { render json: @option_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /option_menus/1
  # PATCH/PUT /option_menus/1.json
  def update
    respond_to do |format|
      if @option_menu.update(option_menu_params)
        format.html { redirect_to @option_menu, notice: 'Option menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @option_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /option_menus/1
  # DELETE /option_menus/1.json
  def destroy
    @option_menu.destroy
    respond_to do |format|
      format.html { redirect_to option_menus_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option_menu
      @option_menu = OptionMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def option_menu_params
      params.require(:option_menu).permit(:id_padre, :nombre, :url_path, :icono, :controlador, :accion, :num_hijos, :estatus)
    end
end
