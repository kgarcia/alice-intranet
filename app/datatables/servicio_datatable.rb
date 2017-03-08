class ServicioDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= %w(Servicio.descripcion Especialista.descripcion)
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= %w(Servicio.descripcion Especialista.descripcion)
  end

  private

  def data
    records.map do |record|
      {
          # comma separated list of the values for each cell of a table row
          # example: record.attribute,
          '0' => record.descripcion,
          '1' => record.especialista.try(:descripcion) || 'Sin especialista',
          'DT_RowId' => record.id,
          '3' => "/agenda_servicio/#{record.id}/detalle"
      }
    end
  end

  def get_raw_records
    # insert query here
    Servicio.left_outer_joins(:especialista).all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
