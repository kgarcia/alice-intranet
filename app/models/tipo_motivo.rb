class TipoMotivo < ApplicationRecord
  has_many :motivos
  def self.titulo
	  return "Tipo de Motivo"
  end

  def citasCanceladasPorTipoMotivo(fecha_inicio, fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "motivos.tipo_motivo_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    return @citas.count
  end

  def promedioDeCitasCanceladasPorTipoMotivo(fecha_inicio, fecha_fin)
    @citas = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where( "motivos.tipo_motivo_id"=> self.id ).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    @total = Cita.joins(eventualidad: { motivo: :tipo_motivo}, turno: { horario: {servicio: {tipo_servicio: :especialidad } } }).where('citas.fecha' => fecha_inicio..fecha_fin).where('citas.estatus' => 5)
    return (@citas.count.to_f / @total.count.to_f)
  end

end
