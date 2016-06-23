class UsersController < ApplicationController

	# New user alloc
	def new
		if !logged_in?
	 		@user = User.new 
		else
			redirect_to home_path
		end
	end
	
	# Showing user data
	def show
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to home_path
		end		
	end
	
	# Creating new user
	def create
	 	@user = User.new(user_params)


		if @user.save
			# when user create his account he is already log in
			session[:user_id] = @user.id
			log_in @user
			redirect_to home_path
			flash[:notice] = 'Cadastro efetuado com sucesso!'
		else
			render :new
		end

	end

	# Searcing user to edit
	def edit
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to home_path
		end			
	end

	def user_params
		params[:user].permit(:name, :email, :password, :password_confirmation,:login, :dateBirthday, :gender, :uf_id, :company_id)
	end
	
	def user_params_update
		params[:user].permit(:name, :dateBirthday, :gender)
	end

	def password_params
		params[:user].permit(:password, :password_confirmation)
	end

	# Deleting user 
	def destroy
		session[:user_id] = nil
 		user = User.find(params[:id])
 		user.attaches.delete_all
 		update_company_user(user.companies)
 		user.companies.delete_all
 		user.topics.delete_all
 		user.comments.delete_all
 		user.attaches.delete_all
 		user.evaluations.delete_all
 		user.denunciations.delete_all
 		user.destroy
	
		redirect_to home_path
	end

	# Updating user 
	def update
    	@user = User.find(params[:id])
    	if @user.update_attributes(user_params_update)
    		respond_to do |format| format.html {redirect_to :action => "show",:id => @user.id}
	    		flash[:notice] = "Perfil atualizado"
	    		format.js # views/users/update.js.erb

	    	end	
    	else
      		flash[:notice] = 'Erro ao atualizar o dado!'
    	end
    	
  	end

  	def update_password
  		@user = User.find(params[:id])
  		if  @user.authenticate(params[:user][:password_older])
  			if @user.update_attributes(password_params)
  				flash[:notice] = 'Senha atualizada com sucesso!'
  			else
  				flash[:notice] = 'Senha de confirmação invalida!'
  			end
  		else
  			flash[:notice] = 'Senha invalida!'
  		end
  		redirect_to :action => "show",:id => @user.id
  	end

  	def update_company_user(companies)
  		companies.each do |c|
  			c.update_attributes(:authenticated => false)
  		end	
  	end
end