class WelcomeController < ApplicationController
    respond_to :html, :js
  def index
  	@users = User.all
  end
  def new
    @user = User.create(:email => "qqqqqqqqq@gmail.com", :password=> params[:password], :password_confirmation=> params[:password_confirmation])
    redirect_to root_path
  end

  def create
  end
end
# private
#     def user_params
#       params.require(:user).permit(:email, :password, :password_confirmation)
#     end