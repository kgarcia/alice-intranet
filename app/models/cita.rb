class Cita < ApplicationRecord
  belongs_to :turno
  belongs_to :persona
  belongs_to :usuario
  belongs_to :tipo_pago
  belongs_to :tipo_cita
  belongs_to :eventualidad
  has_many :evaluacion
  has_many :horario, through: :turno
  has_many :servicio, through: :horarios
  has_many :ubicacion, through: :servicio
  has_many :historial_citas


  def self.titulo
		return "Cita"
	end

  def as_json(options={})
    super(include: { turno:
                       { include:  {horario:
                                      { include:  {servicio:
                                                       { include:  [:ubicacion,:tipo_servicio]
                                                       }
                                                   }
                                      }
                                    }
                        },
                        :persona => {}
                      }
                      )
  end

  def estatusString
    case self.estatus
    when 1
      return "Solicitada"
    when 2
      return "Confirmada"
    when 3
      return "Atendida"
    when 4
      return "Finalizada"
    when 5
      return "Cancelada"
    else
      return "Otro"
    end
  end

  def self.contarEstatus
      @citas = Cita.all.group("estatus").count
      puts @citas
      return @citas
    end

  def self.contarCitasPorEventoYRangoMeses(tipo_servicio, fecha_inicio, fecha_fin)
    @citas = Cita.joins( turno: { horario: { servicio: { tipo_servicio: :eventos } } } )
    if tipo_servicio != nil
      @citas = @citas.where("tipo_servicios.id" => tipo_servicio)
    end
    if fecha_inicio != nil and fecha_fin != nil
      @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)
    end
    return @citas.count
  end

  def self.contarCitasPorDifusionYRangoSemanas(difusion, fecha_inicio, fecha_fin)
    @difusion = Difusion.find(difusion)
    if @difusion.tipo_entidad_id == 1
      @citas = Cita.joins( turno: { horario: :servicio } ).where("horarios.servicio_id" => @difusion.entidad_id)
    else
      @citas = Cita.joins( turno: { horario: { servicio: { tipo_servicio: :eventos } } } ).where("eventos.id" => @difusion.entidad_id)
    end
    if fecha_inicio != nil and fecha_fin != nil
      @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)
    end
    return @citas.count
  end

  def self.contarCitasPorDifusionRangoSemanasYPerfil(difusion, fecha_inicio, fecha_fin)
    @citasPerfil = []
    @patologiasPerfil = []
    @profesionesPerfil = []
    @habitosPerfil = []
    @perfilesServicio = []
    @difusion = Difusion.find(difusion)
    if @difusion.tipo_entidad_id == 1
      puts "ENTRO POR DONDE NO ES".inspect
      @servicio = Servicio.find(@difusion.entidad_id)
      @perfilesServicio = @servicio.tipo_servicio.perfiles
      if @perfilesServicio.length != 0
        #INICIO
        @perfilesServicio.each do |perfil|
            #patologias
            @patologias = perfil.patologias
            if @patologias.length != 0
              @patologias.each do |patologia|
                if !@patologiasPerfil.include?(patologia.id)
                  @patologiasPerfil.push(patologia.id)
                end
              end
            end
            #profesiones
            @profesiones = perfil.profesiones
            if @profesiones.length != 0
              @profesiones.each do |profesion|
                if !@profesionesPerfil.include?(profesion.id)
                  @profesionesPerfil.push(profesion.id)
                end
              end
            end
            #habitos
            @habitos = perfil.habitos
            if @habitos.length != 0
              @habitos.each do |habito|
                if !@habitosPerfil.include?(habito.id)
                  @habitosPerfil.push(habito.id)
                end
              end
            end

            @citas = Cita.joins( turno: { horario: :servicio } ).where("horarios.servicio_id" => @difusion.entidad_id)
            @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)
            @citas.each do |cita|
              @persona = Persona.find(cita.persona.id)
              @patologiasPersona = @persona.patologias
              if @patologiasPersona.length != 0
                @patologiasPersona.each do |patologiaP|
                  if @patologiasPerfil.include?(patologiaP.id)
                    @citasPerfil.push(cita)
                    break
                  end
                end
              end
              @profesionesPersona = @persona.profesiones
              if @profesionesPersona.length != 0
                @profesionesPersona.each do |profesionP|
                  if @profesionesPerfil.include?(profesionP.id)
                    @citasPerfil.push(cita.id)
                    break
                  end
                end
              end
              @habitosPersona = @persona.habitos
              if @habitosPersona.length != 0
                @habitosPersona.each do |habitoP|
                  if @habitosPerfil.include?(habitoP.id)
                    @citasPerfil.push(cita)
                    break
                  end
                end
              end
            end
        end
        #FIN
      end
    else
      @evento = Evento.find(@difusion.entidad_id)

      @evento.tipo_servicios.each do |tipoServicio|
        @perfilesServicio = tipoServicio.perfiles
        if @perfilesServicio.length != 0
          @perfilesServicio.each do |perfil|
              #patologias
              @patologias = perfil.patologias
              if @patologias.length != 0
                @patologias.each do |patologia|
                  if !@patologiasPerfil.include?(patologia.id)
                    @patologiasPerfil.push(patologia.id)
                  end
                end
              end
              #profesiones
              @profesiones = perfil.profesiones
              if @profesiones.length != 0
                @profesiones.each do |profesion|
                  if !@profesionesPerfil.include?(profesion.id)
                    @profesionesPerfil.push(profesion.id)
                  end
                end
              end
              #habitos
              @habitos = perfil.habitos
              if @habitos.length != 0
                @habitos.each do |habito|
                  if !@habitosPerfil.include?(habito.id)
                    @habitosPerfil.push(habito.id)
                  end
                end
              end

              @citas = Cita.joins( turno: { horario: { servicio: { tipo_servicio: :eventos } } } ).where("eventos.id" => @difusion.entidad_id)
              @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)

              @citas.each do |cita|
                @persona = Persona.find(cita.persona.id)
                @patologiasPersona = @persona.patologias
                if @patologiasPersona.length != 0
                  @patologiasPersona.each do |patologiaP|
                    if @patologiasPerfil.include?(patologiaP.id)
                      @citasPerfil.push(cita)
                      break
                    end
                  end
                end
                @profesionesPersona = @persona.profesiones
                if @profesionesPersona.length != 0
                  @profesionesPersona.each do |profesionP|
                    if @profesionesPerfil.include?(profesionP.id)
                      @citasPerfil.push(cita.id)
                      break
                    end
                  end
                end
                @habitosPersona = @persona.habitos
                if @habitosPersona.length != 0
                  @habitosPersona.each do |habitoP|
                    if @habitosPerfil.include?(habitoP.id)
                      @citasPerfil.push(cita)
                      break
                    end
                  end
                end
              end
          end


        end
      end
    end
    return @citasPerfil.count
  end

  def self.contarCitasPorTurno(tipo_turno, servicio, dia, fecha_inicio, fecha_fin)
    @citas = Cita.joins( :turno => [:tipo_turno, horario: :servicio ] )
    if fecha_inicio != nil and fecha_fin != nil
      @citas = @citas.where('citas.fecha' => fecha_inicio..fecha_fin)
    end
    if tipo_turno != nil
      @citas = @citas.where('tipo_turnos.id' => tipo_turno)
    end
    if servicio != nil
      @citas = @citas.where('horarios.servicio_id' => servicio)
    end
    if dia != nil
      @citas = @citas.where('turnos.dia_id' => dia)
    end
    return @citas.count
  end

  def self.contarCitasPorEstadoCivilYServicio(servicio, estadoCivil, fecha_inicio, fecha_fin)
    @citas = Cita.joins( [ :persona, :turno => { horario: :servicio } ] ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if servicio != nil
      @citas = @citas.where("horarios.servicio_id" => servicio)
    end
    if estadoCivil != nil
      @citas = @citas.where("personas.estado_civil_id" => servicio)
    end
    return @citas.count
  end

  def self.contarCitasPorSexoYServicio(servicio, sexo, fecha_inicio, fecha_fin)
    @citas = Cita.joins( [ :persona, :turno => { horario: :servicio  } ] ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if servicio != nil
      @citas = @citas.where("horarios.servicio_id" => servicio)
    end
    if sexo != nil
      @citas = @citas.where("personas.sexo_id" => sexo)
    end
    return @citas.count
  end

  def self.contarCitasPorHabitoYServicio(servicio, habito, fecha_inicio, fecha_fin)
    @citas = Cita.joins( [ :persona => :habitos, :turno => { horario: :servicio  } ] ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if servicio != nil
      @citas = @citas.where("horarios.servicio_id" => servicio)
    end
    if habito != nil
      @citas = @citas.where("habitos.id" => habito)
    end
    return @citas.count
  end

  def self.contarCitasPorProfesionYServicio(servicio, profesion, fecha_inicio, fecha_fin)
    @citas = Cita.joins( [ :persona => :profesiones, :turno => { horario: :servicio  } ] ).where('citas.fecha' => fecha_inicio..fecha_fin)
    if servicio != nil
      @citas = @citas.where("horarios.servicio_id" => servicio)
    end
    if profesion != nil
      @citas = @citas.where("profesiones.id" => profesion)
    end
    return @citas.count
  end

end
