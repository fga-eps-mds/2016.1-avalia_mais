module SessionsHelper
	
	# Log in the given user
	def log_in(user)
		session[:user_id] = user.id
	end

	# Return the current logged-in user
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def authorize
		redirect_to login_path, alert: "Para cadastrar uma empresa é preciso estar logado" if current_user.nil?
	end

	# Returns true if user is logged in, otherwise return false
	def logged_in?
		!current_user.nil?
	end

end