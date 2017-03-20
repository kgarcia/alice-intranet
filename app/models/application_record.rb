class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url
  	  return 'http://192.168.1.103:3000/'
  end
end
