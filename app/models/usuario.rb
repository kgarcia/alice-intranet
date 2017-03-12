class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :rol
  belongs_to :persona
  belongs_to :servicio

  accepts_nested_attributes_for :persona

  before_create :set_default_rol
  # or 
  # before_validation :set_default_role 

  private
  def set_default_rol
  	#raise params.yml
  	#self.rol_id = params[:rol_id]
    #self.rol ||= Rol.find_by(descripcion: 'paciente')
  end

  def self.titulo
    return "Usuario"
  end

end
