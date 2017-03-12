class Turno < ApplicationRecord
  belongs_to :dia, foreign_key:"dia_id"
  belongs_to :horario, foreign_key:"horario_id"
  belongs_to :tipo_turno, foreign_key:"tipo_turno_id"
  has_many :citas

  def self.contarCitas
    @citas = Cita.joins(:turno).group(:tipo_turno_id,:dia_id).count
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

   def numero_pacientes_por_turno
    @horario = Horario.find(self.horario_id)
    if @horario.tiempo_cita !=0
    return self.cantidad_horas/@horario.tiempo_cita
    end
  end

  def arreglo_horario_citas #debe entrar parametro de servicio de web
    if ((self.hora_inicio < self.hora_fin)  and
        Horario.find(self.horario_id).tipo_horario_id ==1 ) #aca es el calculo de horarios para cita (tiempo promedio) por turno
        @turnos_cita = Array.new 
        @horario = Horario.find(self.horario_id)
          for i in 1..self.numero_pacientes_por_turno do
            if(i==1) 
            @turnos_cita.push(self.hora_inicio)

            else
              @turnos_cita.push(@turnos_cita.last + @horario.tiempo_cita.to_int*60)
              puts @turnos_cita.last 
            end
          end

      return      @turnos_cita 

    else  ((self.hora_inicio < self.hora_fin)  and
        Horario.find(self.horario_id).tipo_horario_id ==2 ) #aca es el calculo de horarios para cita por cantidad de pacientes por turno
        @turnos_cita = Array.new 
        @horario = Horario.find(self.horario_id)
        for i in 1..self.cantidad_pacientes do
            if(i==1) 
            @turnos_cita.push(self.hora_inicio)
            
          else
              @turnos_cita.push(@turnos_cita.last + (self.cantidad_horas/self.cantidad_pacientes)*60)
              puts @turnos_cita.last 
          end
        end

      return       @turnos_cita 

    end
  end

  def disponibilidad_horas(fecha)  #fecha que entra
   #falta el parametro que entra
   #fecha_hora_inicio = "2017-03-06s*" #fecha exacta de 1 cita para prueba
   #fecha_hora_inicio.to_date
   #tipo eventualidad =! de 1 chequear fecha exacta
   @d = fecha
   #d = Date.new(2017,03 ,06) 
   @horas_cita = Array.new 
         self.arreglo_horario_citas.each do |hora|
            #construir datetime a partir de la hora y la fecha que venga por parametro
               @fecha = DateTime.new(@d.year, @d.month, @d.day, hora.hour, hora.min)  
            #@fecha = (fecha_hora_inicio + hora.("%H:%M"))
            if !Cita.where(:fecha => fecha).exists?
              @horas_cita.push(@fecha)
            end

          end
          return @horas_cita
    end

 
 

end

