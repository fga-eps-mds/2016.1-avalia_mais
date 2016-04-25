class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(login: params[:session][:login])

		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to user_show_path(user)
		else 
			flash.now[:notice] = 'O login e/ou a senha inválidos'
			render 'new'
		end
	end

	def destroy
	end

end