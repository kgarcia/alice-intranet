class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def url
  	  return 'http://localhost:3000/'
  end
end
