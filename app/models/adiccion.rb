class Adiccion < ApplicationRecord
  belongs_to :tipo_adiccion
  has_many :adiccion_perfiles, dependent: :destroy
  has_many :perfiles, through: :adiccion_perfiles, dependent: :destroy
  has_many :adiccion_personas, dependent: :destroy
  has_many :personas, through: :adiccion_personas, dependent: :destroy

  def tipo
  	return self.tipo_adiccion
  end

  def koala
  	@page_token = "EAACEdEose0cBAAJAIpZBEZAFqwZAXttJ8bRyrOBC5kDWC1p2RZB3DsuUkhQjUgEOZBf9ZCAMHAlHE3QYRNdToS7r3Xj6SzONxe4OThMZBSZCAfLF5L8Ve3w6xXnsiu19Bf8mAVtDdwHkJeuoovHfok8mfYBBaKbd8MmHn3gi2gClfAPqX88anAB8qUgYFxCZByGQZD"
 
  	@page_graph = Koala::Facebook::API.new(@page_token)

  	@page_graph.get_object('me') # I'm a page
	@page_graph.get_connection('me', 'feed') # the page's wall
	@page_graph.put_wall_post('post on page wall') # post as page, requires new publish_pages permission
	@page_graph.put_connections(page_id, 'feed', :message => message, :picture => picture_url, :link => link_url)
  end
  
  def self.titulo
		return "Adicción"
	end

end
