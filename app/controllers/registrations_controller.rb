class RegistrationsController < Devise::RegistrationsController
	def new
	  super
	end

	def create
		@user = User.new(user_params)
		@user.admin = params[:user][:admin] == "admin" ? "true" : "false"
		if @user.save
	  		redirect_to root_path
		else 
	  		render :action => 'new'
		end
	end

	def edit
	  super
	end

	def update
	  super
	end
	
	def destroy
	  super
	end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end
end
