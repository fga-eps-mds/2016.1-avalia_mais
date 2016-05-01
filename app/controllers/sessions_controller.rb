class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to home_path
		end
	end

	def create
		user = find_user_record

		if user && user.authenticate(params[:session][:password])
			log_in user
			# redirect_to user_show_path(user), notice: 'Login realizado com sucesso'
			redirect_to home_path, notice: 'Login realizado com sucesso'
		else 
			flash.now[:notice] = 'Login e/ou a senha inválidos'
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash.now[:notice] = 'Logout efetuado com sucesso'
		redirect_to home_path
	end

	def find_user_record
		User.find_by(login: params[:session][:login]) || User.find_by(email: params[:session][:login])
	end

end