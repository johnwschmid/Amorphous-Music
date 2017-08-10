class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Successfully Signed Up"
			redirect_to 'root'
		else
			flash[:failure] = "Failed To Sign Up"
			render '/signup'
		end
	end

	private
	    def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
	    end
end