class Especialista < ApplicationRecord
  belongs_to :persona

  has_many :especialidad_especialistas, dependent: :destroy
  has_many :especialidades, through: :especialidad_especialistas, dependent: :destroy

  after_save :save_especialidades

  attr_reader :especialidadEspecialistas

  def especialidadEspecialistas=(value)
    @especialidadEspecialistas = value
  end

  def especialidadesDescripcion
    @string = ""
    self.especialidades.each do |especialidad|
      @string = @string + " " + especialidad.descripcion
    end
    return @string
  end

  def nombre
    return self.persona.nombre + " "+ self.persona.apellido
  end

  def self.titulo
    return "Especialista"
  end

  private
   def save_especialidades
    EspecialidadEspecialista.where(:especialista_id => self.id).destroy_all
    if !@especialidadEspecialistas.nil?
        @especialidadEspecialistas.each do |especialidad_id|
          EspecialidadEspecialista.create(especialidad_id: especialidad_id, especialista_id: self.id )
        end
     end
   end

  


end
