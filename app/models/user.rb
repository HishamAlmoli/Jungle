class User < ActiveRecord::Base
    has_secure_password
    #def name 
    #    "#{first_name} #{last_name}"
    #end
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, length: { minimum: 7 }
    validates :password_confirmation, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false } 

    def self.authenticate_with_credentials(email, password)
        if user = self.where("lower(email) = ?", email.strip.downcase).first
          user.authenticate(password)
        end
    end
end