class UsersController < ApplicationController

	# receives form and creates a user from that data
	def create
		
		user = User.new(user_params)

		if user.save
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end   


	private

	def user_params
	 params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end

end
