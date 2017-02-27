class AgendaServicioController < ApplicationController
  def lista
    respond_to do |format|
      format.html
      format.json { render json: ServicioDatatable.new(view_context) }
    end
  end

  def detalle
    @servicio = Servicio.find_by_id(params[:id])

    @items = []

    citas = Cita.left_outer_joins(turno: {horario: :servicio}).where("servicios.id = ?", @servicio.id)
    puts citas
  end
end
