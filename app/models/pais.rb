class Pais < ApplicationRecord
	has_many :estado
	has_many :ciudad, through: :estado
	has_many :ubicacion, through: :ciudad
  def self.titulo
	  return "País"
  end

   def as_json(options={})
    super(include: { estado: 
    					{ include:  {ciudad: 
    									{include: :ubicacion} 
									} 
    					} 
    				})
  end

end

