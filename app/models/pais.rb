class Pais < ApplicationRecord
	has_many :estado, dependent: :destroy
	has_many :ciudad, through: :estado, dependent: :destroy
	has_many :ubicacion, through: :ciudad, dependent: :destroy

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

