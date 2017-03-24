class RolesController < ApplicationController
  before_action :set_rol, only: [:show, :edit, :update, :destroy]

  # GET /roles
  # GET /roles.json
  def index
    @roles = Rol.all
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
  end

  # GET /roles/new
  def new
    @rol = Rol.new

    @padres = OptionMenu.where("num_hijos > 0")
    @id_padres = OptionMenu.select("id").where("num_hijos > 0")
    @hijos = OptionMenu.where("id_padre IS NOT NULL")

    @check_padres = @id_padres.map { |e| e.id}

  end

  # GET /roles/1/edit
  def edit

    @padres = OptionMenu.where("num_hijos > 0")
    @id_padres = OptionMenu.select("id").where("num_hijos > 0")
    @hijos = OptionMenu.where("id_padre IS NOT NULL")

    @check_padres = @id_padres.map { |e| e.id}

  end

  # POST /roles
  # POST /roles.json
  def create
    @rol = Rol.new(rol_params)
    @rol.option_menus = params[:option_menus]

    respond_to do |format|
      if @rol.save
        format.html { redirect_to roles_path, notice: 'El registro se ha creado exitosamente.' }
        format.json { render :show, status: :created, location: @rol }
      else
        format.html { render :new }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    
    @rol.option_menus = params[:option_menus]
    
    respond_to do |format|
      if @rol.update(rol_params)
        format.html { redirect_to roles_path, info: 'El registro se ha actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @rol }
      else
        format.html { render :edit }
        format.json { render json: @rol.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to roles_url, alert: 'El registro se ha eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rol
      @rol = Rol.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rol_params
      params.require(:rol).permit(:descripcion, :option_menus)
    end
end
