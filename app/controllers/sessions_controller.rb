class SessionsController < ApplicationController
	# show login form
	def new
		render("new")
	end

	# set user id in the session
	def create
		user = User.find_by(email: params[:email])

		if(user && user.authenticate(params[:password]))
			session[:user_id] = user.id
			redirect_to '/'
		else
			redirect_to '/login'
		end
	end

	# clear the session when user logs out
	def destroy
		session.clear
		redirect_to('/')
	end
end

#delete '/logout' => 'sessions#destroy'# log out
