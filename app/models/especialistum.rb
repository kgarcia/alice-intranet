class Especialistum < ActiveRecord::Base
  belongs_to :especialidad
  belongs_to :sexo
end
