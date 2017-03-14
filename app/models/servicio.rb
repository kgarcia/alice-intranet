class Servicio < ApplicationRecord
  belongs_to :ubicacion
  belongs_to :tipo_servicio
  belongs_to :especialista

  has_many :horarios
  has_many :usuarios
  has_many :turnos, through: :horarios
  has_many :dia, through: :turnos
  has_many :citas, through: :turnos
  has_many :evaluaciones, through: :citas
  has_many :calificaciones, through: :evaluaciones
  has_many :criterios, through: :calificaciones


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/

  extend FriendlyId
  friendly_id :descripcion, use: :slugged

   
    after_save :save_horario_turnos

  def self.titulo
	  return "Servicio"
  end

  def contarCalificaciones
    return self.criterios.count
  end



 def as_json(options={})
    super(:include => { :especialista => {include: :persona} ,:tipo_servicio => {include: :especialidad}, :horarios => {:include => :turnos} , :ubicacion => {}} 

               )
  end

  def postearFb(difusion)

      @user_graph = Koala::Facebook::API.new('EAANVgP46xeoBAPQYTJZArDgzsX2GEuPMCJJXIJmMW5ZCrFtZC0AYGkVhs8EZB4V4rRQZCZCoWHIppy1JWGXEPT7mzwMHI9bwpTruMAYE4XPbTyuv1t9wwcCBvkJEsj6C6s84nYEq8Q2AHaeUm6odG8vZAatv4HqcEQZD')
      # retrieve collection fo all your managed pages: returns collection of hashes with page id, name, category, access token and permissions
      pages = @user_graph.get_connections('me', 'accounts')
      # get access token for first page
      @page_token = pages.first['access_token']

      # or: retrieve access_token for a given page_id
      #page_token = @user_graph.get_page_access_token(page_id)

      #@page_token = "EAACEdEose0cBAAJAIpZBEZAFqwZAXttJ8bRyrOBC5kDWC1p2RZB3DsuUkhQjUgEOZBf9ZCAMHAlHE3QYRNdToS7r3Xj6SzONxe4OThMZBSZCAfLF5L8Ve3w6xXnsiu19Bf8mAVtDdwHkJeuoovHfok8mfYBBaKbd8MmHn3gi2gClfAPqX88anAB8qUgYFxCZByGQZD"
   
      @page_graph = Koala::Facebook::API.new(@page_token)

      @page_graph.get_object('me') # I'm a page
      @page_graph.get_connection('me', 'feed') # the page's wall
      if(difusion.avatar.file.nil?)
        @page_graph.put_wall_post(difusion.asunto) # post as page, requires new publish_pages permission
      else
        @page_graph.put_picture(difusion.avatar.current_path, ".jpg", {:caption => difusion.asunto}, "me")
      end
      #@page_graph.put_picture(Rails.public_path+'bardenova.jpg', ".jpg", {:caption => @tipo_servicio.descripcion}, "me")
      #@page_graph.put_connections("AliceLaTrinidad", 'feed', :message => message, :picture => picture_url, :link => link_url)
      #@tipo_servicio = self
      

    end
private
def save_horario_turnos

        @horarioNuevo = Horario.create(tiempo_cita: 0,estatus: 1, tipo_horario: TipoHorario.first,servicio_id: self.id)
       for i in 1..7
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "08:00:00" , hora_fin: "08:00:00",estatus: 1,dia_id: i, tipo_turno_id: 1)
          Turno.create(horario_id: @horarioNuevo.id,cantidad_pacientes: 0,hora_inicio: "13:00:00" , hora_fin: "13:00:00",estatus: 1,dia_id: i, tipo_turno_id: 2)

       end
end

end




