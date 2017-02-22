class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :rol
  belongs_to :persona
  before_create :set_default_rol
  # or 
  # before_validation :set_default_role 

  private
  def set_default_rol
  	#raise params.yml
  	#self.rol_id = params[:rol_id]
    #self.rol ||= Rol.find_by(descripcion: 'paciente')
  end

end
