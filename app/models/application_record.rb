class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url
  	  return 'http://192.168.2.8:3000/'
  end
end
