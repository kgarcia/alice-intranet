class Parentesco < ApplicationRecord
  belongs_to :persona
  belongs_to :pariente, :class_name => 'Persona'
  belongs_to :tipo_parentesco

  def self.titulo
    return "Parentesco"
  end


end
