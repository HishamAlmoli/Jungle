class UsersController < ApplicationController
    def new
    end
  
    def create
        user = User.authenticate_with_credentials(params[:email], params[:password])
      #if user.save
      if user
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end  
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end