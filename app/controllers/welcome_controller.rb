class WelcomeController < ApplicationController
     respond_to :html, :js
  def index
  	@users = User.all
  end
  # def new 
  #   @user = User.new
  # end
  def new
    @user = User.create(:email => params[:email], :password=> params[:password], :password_confirmation=> params[:password_confirmation])
    respond_to do |format|
      format.html { render :show, status: :created, location: @user }
        format.json 
        format.js
  end
end
  def create
  end
end
# private
#     def user_params
#       params.require(:user).permit(:email, :password, :password_confirmation)
#     end