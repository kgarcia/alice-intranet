class AgendaServicioController < ApplicationController
  def lista
    respond_to do |format|
      format.html
      format.json { render json: ServicioDatatable.new(view_context) }
    end
  end

  def detalle
    @servicio = Servicio.find_by_id(params[:id])
    respond_to do |format|
      format.html
      format.json {

        @horario = Horario.find_by(:servicio_id => @servicio.id)
        @items = []

        @citas = Cita.where("turno_id IN (?)", @horario.turnos.pluck(:id))
        @eventos = []#@servicio.eventos
        @items = @citas.map do |cita|
          {
              :title => "#{cita.persona.nombre} #{cita.persona.apellido}",
              :start => cita.fecha,
              :cedula_persona => cita.persona.cedula,
              #:tipo_cita => cita.tipo_cita.descripcion,
              :eventualidad => (cita.eventualidad.nil?) ? 'Sin eventualidad.' : cita.eventualidad.descripcion,
              :color => (cita.estatus == 5) ? 'red' : 'green',
              :tipo => 'cita'
          }
        end

        @items += @eventos.map do |evento|
          {
              :title => evento.descripcion,
              :start => Date.today,
              :tipo => 'evento'
          }
        end
        render json: @items

      }
    end


    puts @citas
  end
end
