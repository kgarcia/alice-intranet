class Evento < ApplicationRecord
  belongs_to :tipo_evento
  belongs_to :ubicacion
  has_many :tipo_servicio_evento, dependent: :destroy
  has_many :tipo_servicios, through: :tipo_servicio_evento, dependent: :destroy


  has_attached_file :foto, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :foto, content_type: /\Aimage\/.*\z/


  after_save :save_tipo_servicios

  extend FriendlyId
  friendly_id :descripcion, use: :slugged

  attr_reader :tipoServicioEvento

  	def tipoServicioEvento=(value)
	  	@tipoServicioEvento = value
	  end

  def tipo
    return self.tipo_evento
  end

  def self.titulo
    return "Evento"
  end

  def foto_url
        url+foto.url(:medium)
    end


  def foto_small
        url+foto.url(:small)
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
    def save_tipo_servicios
     TipoServicioEvento.where(:evento_id => self.id).destroy_all
     if !@tipoServicioEvento.nil?
	      @tipoServicioEvento.each do |tipo_servicio_id|
		      TipoServicioEvento.create(tipo_servicio_id: tipo_servicio_id, evento_id: self.id )
        end
	   end
   end
end
