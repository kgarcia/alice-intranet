class BdAdminsController < ApplicationController
  before_action :set_bd_admin, only: [:show, :edit, :update, :destroy]

  # GET /bd_admins
  # GET /bd_admins.json
  def index
    @bd_admins = BdAdmin.all
  end

  # GET /bd_admins/1
  # GET /bd_admins/1.json
  def show
  end

  # GET /bd_admins/new
  def new
    @bd_admin = BdAdmin.new
  end

  # GET /bd_admins/1/edit
  def edit
  end

  # POST /bd_admins
  # POST /bd_admins.json
  def create
    @bd_admin = BdAdmin.new(bd_admin_params)

    respond_to do |format|
      if @bd_admin.save
        format.html { redirect_to @bd_admin, notice: 'Bd admin was successfully created.' }
        format.json { render :show, status: :created, location: @bd_admin }
      else
        format.html { render :new }
        format.json { render json: @bd_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bd_admins/1
  # PATCH/PUT /bd_admins/1.json
  def update
    respond_to do |format|
      if @bd_admin.update(bd_admin_params)
        format.html { redirect_to @bd_admin, notice: 'Bd admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @bd_admin }
      else
        format.html { render :edit }
        format.json { render json: @bd_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bd_admins/1
  # DELETE /bd_admins/1.json
  def destroy
    @bd_admin.destroy
    respond_to do |format|
      format.html { redirect_to bd_admins_url, notice: 'Bd admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def historico
    @BdAdmins = BdAdmin.new

    @stringnes = []

    if Servicio.count > 0
      @stringnes.push("Servicio")
    end
    if Cita.count > 0
      @stringnes.push("Cita")
    end
    if Especialista.count > 0
      @stringnes.push("Especialista")
    end
    if TipoServicio.count > 0
      @stringnes.push("Tipo Servicio")
    end 
    if Persona.count > 0
      @stringnes.push("Persona")
    end
    if Usuario.count > 0
      @stringnes.push("Usuario")
    end
    if Calificacion.count > 0
      @stringnes.push("Calificacion")
    end 
    if Difusion.count > 0
      @stringnes.push("Difusion")
    end
    if Opinion.count > 0
     @stringnes.push("Opinion")
    end

    #@stringnes = ["Servicio", "Cita", "Especialista", "Tipo Servicio", "Persona", "Usuario", "Calificacion", "Difusion", "Opinion"]
    
    render "historico_tablas"
  end

  def cambiarInformacion
    @tablas = params[:e1]
    #puts params['Inactivo'].nil?
    #puts params['Activo'].nil?
    #puts params['BdAdmin']['fecha_inicio(1i)']
    #puts params['BdAdmin']['fecha_inicio(2i)']
    #puts params['BdAdmin']['fecha_inicio(3i)']
    
    @d = Date.new(params['BdAdmin']['fecha_inicio(1i)'].to_i,params['BdAdmin']['fecha_inicio(2i)'].to_i,params['BdAdmin']['fecha_inicio(3i)'].to_i)
    @fecha = DateTime.new(@d.year, @d.month, @d.day,23,59,00)

    # Uno (1) representa quiere activos e inactivos, 2 solo activos, 3 incativos
    $decision = 1

    if params['Inactivo'] == "0" and params['Activo'] == "1"
      $decision = 1
      puts "Inactivo activo"
      puts $decision
    else
      if params['Inactivo'] == "0"
        puts "Inactivo"

         $decision = 2
         puts $decision
       else
        puts "Inactivo"
         $decision = 3
         puts $decision
      end
    end

    @tablas.each do |tabla|
      case tabla[0]
      when "Servicio"
        
        @servicios = Servicio.all

        @servicios.each do |servicio|
          his_servicio = HisServicio.new
          if  $decision == 1 and servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_servicio.descripcion = servicio.descripcion
              his_servicio.ubicacion = servicio.ubicacion.id
              his_servicio.tipo_servicio = servicio.tipo_servicio.id
              his_servicio.especialista = servicio.especialista.id
              his_servicio.estatus = servicio.estatus
              his_servicio.precio = servicio.precio
              his_servicio.save          
          else
            if $decision == 2 and servicio.estatus == 2 and servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_servicio.descripcion = servicio.descripcion
              his_servicio.ubicacion = servicio.ubicacion.id
              his_servicio.tipo_servicio = servicio.tipo_servicio.id
              his_servicio.especialista = servicio.especialista.id
              his_servicio.estatus = servicio.estatus
              his_servicio.precio = servicio.precio
              his_servicio.save    
            else
              if $decision == 3 and servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_servicio.descripcion = servicio.descripcion
              his_servicio.ubicacion = servicio.ubicacion.id
              his_servicio.tipo_servicio = servicio.tipo_servicio.id
              his_servicio.especialista = servicio.especialista.id
              his_servicio.estatus = servicio.estatus
              his_servicio.precio = servicio.precio
              his_servicio.save 
                 end #end del if
                end #end del for
               end
               servicio.destroy
              end
      when "Cita"
        
        @citas = Cita.all
        @citas.each do |cita|
          his_cita = HisCita.new
          if $decision == 1 and cita.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_cita.turno = cita.turno.id
              his_cita.persona = cita.persona.id
              his_cita.usuario = cita.usuario.id
              his_cita.fecha = cita.fecha
              his_cita.tipo_pago = cita.tipo_pago.id
              his_cita.eventualidad = cita.eventualidad.id
              his_cita.estatus = cita.estatus
              his_cita.save          
          else 
            if $decision == 2 and cita.estatus == 5 and cita.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_cita.turno = cita.turno.id
              his_cita.persona = cita.persona.id
              his_cita.usuario = cita.usuario.id
              his_cita.fecha = cita.fecha
              his_cita.tipo_pago = cita.tipo_pago.id
              his_cita.eventualidad = cita.eventualidad.id
              his_cita.estatus = cita.estatus
              his_cita.save          
            else
              if $decision == 3 and cita.estatus == 1 and cita.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
              his_cita.turno = cita.turno.id
              his_cita.persona = cita.persona.id
              his_cita.usuario = cita.usuario.id
              his_cita.fecha = cita.fecha
              his_cita.tipo_pago = cita.tipo_pago.id
              his_cita.eventualidad = cita.eventualidad.id
              his_cita.estatus = cita.estatus
              his_cita.save          
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
              end #end del for
             end
             cita.destroy
            end
      when "Especialista"
        
        @especialistas = Especialista.all
        @especialistas.each do |especialista|
          his_especialista = HisEspecialista.new
          if $decision == 1 and especialista.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                #his_especialista.universidad = especialista.universidad.id
                #his_especialista.formacion_academica = especialista.formacion_academica.id
                his_especialista.persona = especialista.persona.id
                his_especialista.estatus = especialista.estatus
                his_especialista.save          
          else
            if $decision == 2 and especialista.estatus == 2 and especialista.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                #his_especialista.universidad = especialista.universidad.id
                #his_especialista.formacion_academica = especialista.formacion_academica.id
                his_especialista.persona = especialista.persona.id
                his_especialista.estatus = especialista.estatus
                his_especialista.save            
            else
              if $decision == 3 and especialista.estatus == 1 and especialista.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                #his_especialista.universidad = especialista.universidad.id
                #his_especialista.formacion_academica = especialista.formacion_academica.id
                his_especialista.persona = especialista.persona.id
                his_especialista.estatus = especialista.estatus
                his_especialista.save               
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end

             $services = Servicio.where(:especialista => especialista.id)
             $services.each do |serv|
                puts 'Soy un servicio violento'
                serv.destroy
             end

             #este tambien destruye al especialista

             $peer = Persona.find(especialista.persona.id)

             $peer.destroy


            end
      when "Tipo Servicio"
        
        @tipos_servicios = TipoServicio.all
        @tipos_servicios.each do |tipo_servicio|
          his_tipoServicio = HisTipoServicio.new
          if $decision == 1 and tipo_servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_tipoServicio.descripcion = tipo_servicio.descripcion
                his_tipoServicio.texto = tipo_servicio.texto
                his_tipoServicio.estatus = tipo_servicio.estatus
                his_tipoServicio.categoria = tipo_servicio.categoria.id
                his_tipoServicio.especialidad = tipo_servicio.especialidad.id
                his_tipoServicio.tipo_atencion = tipo_servicio.tipo_atencion.id
                his_tipoServicio.save          
          else
            if $decision == 2 and tipo_servicio.estatus == 2 and tipo_servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_tipoServicio.descripcion = tipo_servicio.descripcion
                his_tipoServicio.texto = tipo_servicio.texto
                his_tipoServicio.estatus = tipo_servicio.estatus
                his_tipoServicio.categoria = tipo_servicio.categoria.id
                his_tipoServicio.especialidad = tipo_servicio.especialidad.id
                his_tipoServicio.tipo_atencion = tipo_servicio.tipo_atencion.id
                his_tipoServicio.save          
            else
              if $decision == 3 and tipo_servicio.estatus == 1 and tipo_servicio.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_tipoServicio.descripcion = tipo_servicio.descripcion
                his_tipoServicio.texto = tipo_servicio.texto
                his_tipoServicio.estatus = tipo_servicio.estatus
                his_tipoServicio.categoria = tipo_servicio.categoria.id
                his_tipoServicio.especialidad = tipo_servicio.especialidad.id
                his_tipoServicio.tipo_atencion = tipo_servicio.tipo_atencion.id
                his_tipoServicio.save           
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end
             tipo_servicio.destroy
            end
      when "Persona"
        
        @personas = Persona.all
        @personas.each do |persona|
          his_persona = HisPersona.new
          if $decision == 1 and persona.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_persona.cedula = persona.cedula
                his_persona.nombre = persona.nombre
                his_persona.apellido = persona.apellido
                his_persona.telefono = persona.telefono
                his_persona.direccion = persona.direccion
                his_persona.fecha_nacimiento = persona.fecha_nacimiento
                his_persona.sexo = persona.sexo.id
                his_persona.save          
          else
            if $decision == 2 and persona.estatus == 2 and persona.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_persona.cedula = persona.cedula
                his_persona.nombre = persona.nombre
                his_persona.apellido = persona.apellido
                his_persona.telefono = persona.telefono
                his_persona.direccion = persona.direccion
                his_persona.fecha_nacimiento = persona.fecha_nacimiento
                his_persona.sexo = persona.sexo.id
                his_persona.save  
            else
              if $decision == 3 and persona.estatus == 1 and persona.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_persona.cedula = persona.cedula
                his_persona.nombre = persona.nombre
                his_persona.apellido = persona.apellido
                his_persona.telefono = persona.telefono
                his_persona.direccion = persona.direccion
                his_persona.fecha_nacimiento = persona.fecha_nacimiento
                his_persona.sexo = persona.sexo.id
                his_persona.save            
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
              end #end del for
             end

             $esp = Especialista.find_by persona_id: persona.id

                  #este tambien destruye al especialista

                  $peer = Persona.find($esp.id)

               if !$esp.nil?

                  $services = Servicio.where(:especialista => $esp.id)
                  $services.each do |serv|
                      puts 'Soy un servicio violento'
                      serv.destroy
                  end

                  $peer.destroy
                 
               end

            end
      when "Usuario"
      
      @usuarios = Usuario.all
      @usuarios.each do |usuario|
        his_usuario = HisUsuario.new
          if $decision == 1 and usuario.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_usuario.email = usuario.email
                his_usuario.encrypted_password = usuario.encrypted_password
                his_usuario.reset_password_token = usuario.reset_password_token
                his_usuario.reset_password_sent_at = usuario.reset_password_sent_at
                his_usuario.remember_created_at = usuario.remember_created_at
                his_usuario.sign_in_count = usuario.sign_in_count
                his_usuario.current_sign_in_at = usuario.current_sign_in_at
                his_usuario.last_sign_in_at = usuario.last_sign_in_at
                his_usuario.current_sign_in_ip = usuario.current_sign_in_ip
                his_usuario.last_sign_in_ip = usuario.last_sign_in_ip
                his_usuario.persona = usuario.persona.id
                his_usuario.rol = usuario.rol.id
                his_usuario.servicio = usuario.servicio.id
                his_usuario.save          
          else
            if $decision == 2 and usuario.estatus == 2 and usuario.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_usuario.email = usuario.email
                his_usuario.encrypted_password = usuario.encrypted_password
                his_usuario.reset_password_token = usuario.reset_password_token
                his_usuario.reset_password_sent_at = usuario.reset_password_sent_at
                his_usuario.remember_created_at = usuario.remember_created_at
                his_usuario.sign_in_count = usuario.sign_in_count
                his_usuario.current_sign_in_at = usuario.current_sign_in_at
                his_usuario.last_sign_in_at = usuario.last_sign_in_at
                his_usuario.current_sign_in_ip = usuario.current_sign_in_ip
                his_usuario.last_sign_in_ip = usuario.last_sign_in_ip
                his_usuario.persona = usuario.persona.id
                his_usuario.rol = usuario.rol.id
                his_usuario.servicio = usuario.servicio.id
                his_usuario.save        
            else
              if $decision == 3 and usuario.estatus == 1 and usuario.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_usuario.email = usuario.email
                his_usuario.encrypted_password = usuario.encrypted_password
                his_usuario.reset_password_token = usuario.reset_password_token
                his_usuario.reset_password_sent_at = usuario.reset_password_sent_at
                his_usuario.remember_created_at = usuario.remember_created_at
                his_usuario.sign_in_count = usuario.sign_in_count
                his_usuario.current_sign_in_at = usuario.current_sign_in_at
                his_usuario.last_sign_in_at = usuario.last_sign_in_at
                his_usuario.current_sign_in_ip = usuario.current_sign_in_ip
                his_usuario.last_sign_in_ip = usuario.last_sign_in_ip
                his_usuario.persona = usuario.persona.id
                his_usuario.rol = usuario.rol.id
                his_usuario.servicio = usuario.servicio.id
                his_usuario.save                   
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end
             usuario.destroy
            end
      when "Calificacion"
      
      @calificaciones = Calificacion.all
      @calificaciones.each do |calificacion|
        his_calificacion = HisCalificacion.new
          if $decision == 1 and calificacion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_calificacion.descripcion = calificacion.descripcion
                his_calificacion.estatus = calificacion.estatus
                his_calificacion.tipo_calificacion = calificacion.tipo_calificacion
                his_calificacion.criterio = calificacion.criterio.id
                his_calificacion.evaluacion = calificacion.evaluacion.id
                his_calificacion.save          
          else
            if $decision == 2 and calificacion.estatus == 2 and calificacion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_calificacion.descripcion = calificacion.descripcion
                his_calificacion.estatus = calificacion.estatus
                his_calificacion.tipo_calificacion = calificacion.tipo_calificacion
                his_calificacion.criterio = calificacion.criterio.id
                his_calificacion.evaluacion = calificacion.evaluacion.id
                his_calificacion.save               
            else
              if $decision == 3 and calificacion.estatus == 1 and calificacion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_calificacion.descripcion = calificacion.descripcion
                his_calificacion.estatus = calificacion.estatus
                his_calificacion.tipo_calificacion = calificacion.tipo_calificacion
                his_calificacion.criterio = calificacion.criterio.id
                his_calificacion.evaluacion = calificacion.evaluacion.id
                his_calificacion.save                              
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end
             calificacion.destroy
            end
      when "Difusion"
      
      @difusion = Difusion.all
      @difusion.each do |difusion|
        his_difusion = HisDifusion.new
          if $decision == 1 and difusion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_difusion.asunto = difusion.asunto
                his_difusion.texto = difusion.texto
                his_difusion.tipo_entidad = difusion.tipo_entidad.id
                his_difusion.entidad = difusion.entidad.id
                his_difusion.token = difusion.token_facebook
                his_difusion.tipo_difusion = difusion.tipo_difusion.id
                his_difusion.estatus = difusion.estatus
                his_difusion.save          
          else
            if $decision == 2 and difusion.estatus == 2 and difusion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_difusion.asunto = difusion.asunto
                his_difusion.texto = difusion.texto
                his_difusion.tipo_entidad = difusion.tipo_entidad.id
                his_difusion.entidad = difusion.entidad.id
                his_difusion.token = difusion.token_facebook
                his_difusion.tipo_difusion = difusion.tipo_difusion.id
                his_difusion.estatus = difusion.estatus
                his_difusion.save          
            else
              if $decision == 3 and difusion.estatus == 1 and difusion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_difusion.asunto = difusion.asunto
                his_difusion.texto = difusion.texto
                his_difusion.tipo_entidad = difusion.tipo_entidad.id
                his_difusion.entidad = difusion.entidad.id
                his_difusion.token = difusion.token_facebook
                his_difusion.tipo_difusion = difusion.tipo_difusion.id
                his_difusion.estatus = difusion.estatus
                his_difusion.save                       
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end
             difusion.destroy
            end      
      when "Opinion"

      @opiniones = Opinion.all
      @opiniones.each do |opinion|
        his_opinion = HisOpinion.new
          if $decision == 1 and opinion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_opinion.correo = opinion.correo
                his_opinion.nombre = opinion.nombre
                his_opinion.descripcion = opinion.descripcion
                his_opinion.tipo_opinion = opinion.tipo_opinion.id
                his_opinion.motivo = opinion.motivo.id
                his_opinion.estatus = opinion
                his_opinion.save          
          else
            if $decision == 2 and opinion.estatus == 2 and opinion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_opinion.correo = opinion.correo
                his_opinion.nombre = opinion.nombre
                his_opinion.descripcion = opinion.descripcion
                his_opinion.tipo_opinion = opinion.tipo_opinion.id
                his_opinion.motivo = opinion.motivo.id
                his_opinion.estatus = opinion
                his_opinion.save   
            else
              if $decision == 3 and opinion.estatus == 1 and opinion.created_at.to_s(:number).to_i < @fecha.to_s(:number).to_i
                his_opinion.correo = opinion.correo
                his_opinion.nombre = opinion.nombre
                his_opinion.descripcion = opinion.descripcion
                his_opinion.tipo_opinion = opinion.tipo_opinion.id
                his_opinion.motivo = opinion.motivo.id
                his_opinion.estatus = opinion
                his_opinion.save                   
               end #end del if
                 #Agregar cascades y permitir el metodo de abajo sino lanza error
                 
              end #end del for
             end
             opinion.destroy
            end      
      end

    end

    respond_to do |format|
      format.html { redirect_to :historico, info: 'Los registros han sido migrados y eliminados exitosamente' and return}
    end

  end

 # def back
  #  @BdAdmins = BdAdmin.new

   # @f = "<option value='1'> Por defecto </option><option value='2'> Texto plano </option><option value='3'> Comprimido </option>".html_safe

    #render "backup_tablas"
  #end

  def guardarback

    if request.post?

    $controlbackups = BdAdmin.new
    $controlbackups.fecha_inicio = Time.now.strftime("%d/%m/%Y")
    $controlbackups.save

    #if params['escri'] == 1

      system "rake db:dumpwname["+$controlbackups.id.to_s+"]"

    #else

     # system "rake db:dumpwname["+$controlbackups.id.to_s+"]"
      
    #end

    else

    render "backup_tablas" 

    end #If de la request
        
  end #end metodo

  def restauration

    @f = "<option value='1'> Primero </option><option value='2'> Segundo </option><option value='3'> Tercero</option>".html_safe    

    if BdAdmin.count >= 3
      $ultimos = BdAdmin.last(3)
      @obj = $ultimos[0]
      @obj2 = $ultimos[1]
      @obj3 = $ultimos[2] 
      $id_primero = @obj.id   
      else
        if BdAdmin.count == 2
        $ultimos = BdAdmin.last(3)
        @obj = $ultimos[0]
        @obj2 = $ultimos[1]
        @obj3 = nil
        $id_primero = @obj.id
        else 
        if BdAdmin.count == 1
          $ultimos = BdAdmin.last
          @obj = $ultimos
          @obj2 = nil
          @obj3 = nil
          #$id_primero = @obj.id  
          puts 'Aquiiiiiiiiiiiiiiii Obj'
          puts @obj.id                  
            end          
        end
    end

    if BdAdmin.count <= 0

      head :no_content

    else

    if request.post?

      case params['foos']
      when "Primero"
        if BdAdmin.count > 2
           $ultimos = BdAdmin.last(3)
           $obj = $ultimos[0]
           $id_primero = $obj.id

           system "rake db:restoredos["+$id_primero.to_s+"]"

        end
      when "Segundo"
        if BdAdmin.count > 2
           $ultimos = BdAdmin.last(3)
           $obj = $ultimos[1]
           $id_primero = $obj.id

           system "rake db:restoredos["+$id_primero.to_s+"]"
        end
      when "Tercero"
        if BdAdmin.count > 2
           $ultimos = BdAdmin.last(3)
           $obj = $ultimos[2]
           $id_primero = $obj.id

           system "rake db:restoredos["+$id_primero.to_s+"]"
        end
      else  
           $ultimo = BdAdmin.last
           $id = $ultimo.id

           system "rake db:restoredos["+$id.to_s+"]"
      end

      #system "rake db:restoredos[@a]"

    else

    render "restore_tablas"

    end

    end
  end

  #def guardarrestauration

   # @a = params['ruta']
    
    #system "rake db:restoredos[@a]"
  #end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bd_admin
      @bd_admin = BdAdmin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bd_admin_params
      params.require(:bd_admin).permit(:historico, :hora_backup, :opcion_estatus, :fecha_inicio, :estatus)
    end
end
