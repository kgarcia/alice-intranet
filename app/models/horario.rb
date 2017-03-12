class Horario < ApplicationRecord
  belongs_to :tipo_horario, foreign_key: "tipo_horario_id"
  has_many :turnos

  belongs_to :servicio

  def tipo
  	return self.tipo_horario
  end

  def self.titulo
	  return "Tipo de Horario"
  end
  
  def cantidad_pacientes_turno
  	return turno.cantidad_horas/horario.tiempo_cita
  end


  def disponibilidad_semana(fecha1)
        #fecha_hora_inicio.wday #devuelve el numero del dia
        #fecha_inicio7 = fecha_hora_inicio + 7 #semana a partir de la fecha actual
        # Date.new(2017,03,06).wday
        #BUSCAR TODOS LOS TURNOS que recibo de la solicitud de la cita 
        @fecha1 = fecha1.to_datetime

        @fecha_nueva = @fecha1.at_beginning_of_week
       
        #@fecha1 = DateTime.new(d.year, d.month, d.day)
        #@turnos = Turno.where(horario_id: self.id)# => self.id)
        @disponibilidad_mañana =  Array.new
        @disponibilidad_tarde =  Array.new
        @disponibilidad_semanas = Array.new

         
          (1..7).each do |dia|
              @turnoM = Turno.where(horario_id: self.id,:dia_id => dia ,:tipo_turno_id => 1).take
              @turnoT = Turno.where(horario_id: self.id,:dia_id => dia , :tipo_turno_id => 2).take
                  @disponibilidad_mañana.push(@turnoM.disponibilidad_horas(@fecha_nueva))
                  @disponibilidad_tarde.push(@turnoT.disponibilidad_horas(@fecha_nueva))
                  @fecha_nueva = @fecha_nueva + 1.day
                
          end
          
            @disponibilidad_semanas.push(@disponibilidad_mañana)
            @disponibilidad_semanas.push(@disponibilidad_tarde)
          
          puts @disponibilidad_semanas
  end

  def disponibles_mañana    
    @disponibilidad_mañana 
  end

  def disponibles_tarde    
    @disponibilidad_tarde 
  end

    def disponibilidad_semana_dia(fecha1)
        #fecha_hora_inicio.wday #devuelve el numero del dia
        #fecha_inicio7 = fecha_hora_inicio + 7 #semana a partir de la fecha actual
        # Date.new(2017,03,06).wday
        #BUSCAR TODOS LOS TURNOS que recibo de la solicitud de la cita 
        @fecha1 = fecha1.to_datetime

        @fecha_nueva = @fecha1.at_beginning_of_week
       
        #@fecha1 = DateTime.new(d.year, d.month, d.day)
        #@turnos = Turno.where(horario_id: self.id)# => self.id)
        
        @disponibilidad_total = Array.new
        @disponibilidad_mañana =  Array.new
        @disponibilidad_tarde =  Array.new

        @disponibilidad_lunesT =  Array.new
        @disponibilidad_lunesM = Array.new
        @disponibilidad_martesM = Array.new 
        @disponibilidad_martesT = Array.new
        @disponibilidad_miercolesM = Array.new
        @disponibilidad_miercolesT = Array.new
        @disponibilidad_juevesM = Array.new
        @disponibilidad_juevesT = Array.new
        @disponibilidad_viernesM = Array.new
        @disponibilidad_viernesT = Array.new
        @disponibilidad_sabadoM = Array.new
        @disponibilidad_sabadoT = Array.new
        @disponibilidad_domingoM = Array.new
        @disponibilidad_domingoT = Array.new

          (1..7).each do |dia|
              

                @turnoM = Turno.where(horario_id: self.id,:dia_id => dia ,:tipo_turno_id => 1, :dia_id => dia).take
                @turnoT = Turno.where(horario_id: self.id,:dia_id => dia , :tipo_turno_id => 2, :dia_id => dia).take
                if (dia == 1)
                  @disponibilidad_mañana.push(@disponibilidad_lunesM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_lunesT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 2)
                  @disponibilidad_mañana.push(@disponibilidad_martesM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_martesT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 3)
                  @disponibilidad_mañana.push(@disponibilidad_miercolesM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_miercolesT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 4)
                  @disponibilidad_mañana.push(@disponibilidad_juevesM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_juevesT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 5)
                  @disponibilidad_mañana.push(@disponibilidad_viernesM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_viernesT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 6)
                  @disponibilidad_mañana.push(@disponibilidad_sabadoM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_sabadoT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
                if(dia == 7)
                  @disponibilidad_mañana.push(@disponibilidad_domingoM.push(@turnoM.disponibilidad_horas(@fecha_nueva)))
                  @disponibilidad_tarde.push(@disponibilidad_domingoT.push(@turnoT.disponibilidad_horas(@fecha_nueva)))
                end
             
                  

                @fecha_nueva = @fecha_nueva + 1.day
                
        

          end
             puts 'MAÑANA TODO LAFHJSGHJAGHASJHGJASGHJASGHSJGHSJGHJGHJAGHSJGH'
          
            @disponibilidad_total.push(@disponibilidad_mañana)
            @disponibilidad_total.push(@disponibilidad_tarde)
            puts @disponibilidad_mañana
              puts 'TARDE TODO LAFHJSGHJAGHASJHGJASGHJASGHSJGHSJGHJGHJAGHSJGH'
            puts @disponibilidad_tarde
              puts 'SEMANA LAFHJSGHJAGHASJHGJASGHJASGHSJGHSJGHJGHJAGHSJGH'
            puts @disponibilidad_total
               puts 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaLAFHJSGHJAGHASJHGJASGHJASGHSJGHSJGHJGHJAGHSJGH'
     return @disponibilidad_total
                           
  end


end
