class User < ApplicationRecord
    has_secure_password
    def name 
        "#{first_name} #{last_name}"
    end 
end