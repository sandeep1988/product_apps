class WelcomeController < ApplicationController
  def index
  	@users = User.all
  end
  def new
    @user = User.create(:email => "bbb@gmail.com", :password=> "12345678", :password_confirmation=> "12345678")
    redirect_to root_path
  end
  def create
  end
end
private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end