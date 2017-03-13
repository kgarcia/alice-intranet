class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url
  	  return 'http://192.168.0.105:3000/'
  end
end
