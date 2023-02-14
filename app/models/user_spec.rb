require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do 
      @user = User.new(
        first_name: "test", 
        last_name:"user", 
        email: "test@test.com", 
        password:"123456789", 
        password_confirmation:"123456789"
        )
    end
    it "user is valid with valid attributes" do
      expect(@user).to be_valid
    end
    it "user is not valid when password is blank" do
      @user.password = nil
      expect(@user).not_to be_valid
    end
    it "user is not valid when password length is less than 6" do
      @user.password = "1234"
      expect(@user).not_to be_valid
    end
    it "user is not valid when password is empty" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end