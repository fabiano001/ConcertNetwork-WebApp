class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
  	if(@current_user.nil?)
  		@current_user = User.find_by(id: session[:user_id])
  	end

  	return @current_user

  end

  def  authorize_user
  	unless current_user().present?
  		flash[:message] = "Please log in or register to access this page."
  		redirect_to("/login")
  	end	
  end

  def admin_only
  	unless current_user().present? && current_user.role == "admin"
  		flash[:message] = "Access denied. You must be an admin to see this page."

  		redirect_to("/")
  	end
  end

end
