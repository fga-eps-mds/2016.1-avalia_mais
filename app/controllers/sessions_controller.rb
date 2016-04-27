class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(login: params[:session][:login])

		if user && user.authenticate(params[:session][:password])
			log_in user
			redirect_to user_show_path(user), notice: "Login realizado com sucesso"
		else 
			flash.now[:notice] = 'Login e/ou a senha inválidos'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to  home_path, notice: "Você saiu"
	end

end