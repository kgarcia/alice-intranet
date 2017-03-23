class Turno < ApplicationRecord

  belongs_to :dia, foreign_key:"dia_id"
  belongs_to :horario, foreign_key:"horario_id"
  belongs_to :tipo_turno, foreign_key:"tipo_turno_id"
  has_many :citas, dependent: :destroy

  def self.contarCitasTurno
    @citas = Cita.joins(:turno).group(:tipo_turno_id,:dia_id).count
  end

  def self.contarCitas
    @citas = Turno.joins(:citas).group("turnos.tipo_turno_id").count
    return @citas
  end
  
  def dia_descripcion
    puts self.dia.descripcion
  end

  def cantidad_horas
	(((self.hora_fin).to_time-(self.hora_inicio).to_time )/60).round
  end

  def tipo_turno
  	return self.tipo_turno
  end

  def self.titulo
	  return "Turnos"
  end

   def numero_pacientes_por_turno #método que solo funciona para tiempo promedio de atención
    @horario = Horario.find(self.horario_id)
    if (@horario.tiempo_cita !=0 and @horario.tipo_horario_id == 2) #2 es tiempo promedio de atencion
    return self.cantidad_horas/@horario.tiempo_cita
    end
  end

  def arreglo_horario_citas(fecha) #debe entrar parametro de servicio de web
    if ((self.hora_inicio < self.hora_fin)  and
        Horario.find(self.horario_id).tipo_horario_id ==2 ) #aca es el calculo de horarios para cita (tiempo promedio) por turno
        
        @turnos_cita = Array.new
        
        @horario = Horario.find(self.horario_id)
          puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
          
          @hora =Time.now.to_formatted_s(:time).to_s
          @hora = @hora.to_s.gsub(':','').to_i
          
          @prueba = fecha.to_formatted_s(:number).to_s
          @prueba = @prueba.gsub('000000','').to_i
          @bloque = 0
          puts @hora

          @fecha = Date.today.to_formatted_s(:number).to_i
          puts @fecha
          puts @prueba
          puts '----------------------------------------'
          
              
          puts '----------------------------------------'
          @hora_acum = 0


          if @fecha == @prueba
            for i in 1..self.numero_pacientes_por_turno do
              
              if(i==1) 

                @bloque = self.hora_inicio
                @bloque = @bloque.to_formatted_s(:time)
                @bloque = @bloque.gsub(':','').to_i

                if @bloque > @hora
                  @turnos_cita.push(self.hora_inicio)
                end
              else

                @hora_acum = @hora_acum + @horario.tiempo_cita.to_int*60
                @bloque = self.hora_inicio + @hora_acum

                #@bloque = @turnos_cita.last + (@horario.tiempo_cita.to_int*60)
                @bloque = @bloque.to_formatted_s(:time)
                @bloque = @bloque.gsub(':','').to_i
                
                if @bloque > @hora
                  #@turnos_cita.push(@turnos_cita.last  + @horario.tiempo_cita.to_int*60)
                  @turnos_cita.push(self.hora_inicio + @hora_acum)
                end
                
                puts @turnos_cita.last 
              
              end
            end
          elsif @fecha < @prueba
            for i in 1..self.numero_pacientes_por_turno do
              
              if(i==1) 
                @turnos_cita.push(self.hora_inicio)
              else

                @turnos_cita.push(@turnos_cita.last  + @horario.tiempo_cita.to_int*60)
                puts @turnos_cita.last 
              
              end
            end
          end

      return      @turnos_cita 

    else  ((self.hora_inicio < self.hora_fin)  and
        Horario.find(self.horario_id).tipo_horario_id ==1 ) #aca es el calculo de horarios para cita por cantidad de pacientes por turno
        @turnos_cita = Array.new 
        @horario = Horario.find(self.horario_id)
        for i in 1..self.cantidad_pacientes do
            if(i==1) 
            @turnos_cita.push(self.hora_inicio)
            
          else
              @turnos_cita.push(@turnos_cita.last + (self.cantidad_horas/self.cantidad_pacientes)*60)
              #puts @turnos_cita.last 
          end
        end

      return       @turnos_cita 

    end
  end

  def disponibilidad_horas(fecha)  
   @d = fecha 
   @horas_cita = Array.new 
         self.arreglo_horario_citas.each do |hora|
               @fecha = DateTime.new(@d.year, @d.month, @d.day, hora.hour, hora.min)  
               #puts @fecha
            if !Cita.where(turno_id: self.id ,:fecha => @fecha,:estatus => 1).exists?
              #puts 'push'
              @horas_cita.push(hora: @fecha)
            end
          end
          return @horas_cita
    end

     def citas_disponibles_turno(fecha1)
      if(Horario.find(self.horario_id).tipo_horario_id ==1)#tipo 1 es cantidad de pacientes 
        @citas = Cita.where(turno_id: self.id , fecha: fecha1)
          return (self.cantidad_pacientes - @citas.size)
      end
     end

 
 def disponibilidad_horas_eventualidad(fecha)  #metodo que se usa
   @d = fecha
   @horas_cita = Array.new 
   #puts self.arreglo_horario_citas
         self.arreglo_horario_citas(@d).each do |hora|
              @fecha = DateTime.new(@d.year, @d.month, @d.day, hora.hour, hora.min)
              if (( !Cita.where(turno_id: self.id ,:fecha => @fecha,:estatus => 1).exists?)) 
                if ( !(Eventualidad.where('fecha_inicio <=?', @fecha).where('fecha_fin >=?',@fecha).where('tipo_eventualidad_id =?',3)).exists?)
                  @horas_cita.push(hora: @fecha) 
                end

              end
         end
          return @horas_cita

end


end
