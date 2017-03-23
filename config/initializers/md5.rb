module Devise
  module Encryptable
    module Encryptors
      class Md5 < Base
        def self.digest(password, stretches, salt, pepper)
          puts str
          str = password
          return str
        end
      end
    end
  end
end