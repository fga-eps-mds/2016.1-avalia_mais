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
		# if @user != current_user
		# 	redirect_to home_path
		# end		
	end
	
	# Creating new user
	def create

	 	@user = User.new(user_params)


		if @user.save
			# when user create his account he is already log in
			session[:user_id] = @user.id
			flash[:notice] = 'Cadastro efetuado com sucesso!'
			redirect_to :action => "show",:id => @user.id
		else
			render :new
		end

	end

	# Searcing user to edit
	def edit
		@user = User.find(params[:id])
		# if @user != current_user
		# 	redirect_to home_path
		# end			
	end

	def user_params
		params[:user].permit(:name, :email, :password, :password_confirmation,:login, :dateBirthday, :gender)
	end
	
	def user_params_update
		params[:user].permit(:name, :email, :password,:login, :dateBirthday, :gender)
	end
	
	# Deleting user 
	def destroy
		session[:user_id] = nil
 		user = User.find(params[:id])
 		user.destroy
	
		redirect_to home_path

	end

	# Updating user 
	def update

    	@user = User.find(params[:id])

    	if @user.update_attributes(user_params)
    		respond_to do |format| format.html {redirect_to :action => "show",:id => @user.id}
	    		flash[:success] = "Profile updated"
	    		format.js # views/users/update.js.erb
    		end
    	else
      		render 'edit'
      		format.js # views/users/update.js.erb
    	end
  	end

  	def user_params
		params[:user].permit(:name, :email, :password,:password_confirmation,:login, :dateBirthday, :gender)
	end

	def user_params_update
		params[:user].permit(:name, :email, :password,:login, :dateBirthday, :gender)
	end
end