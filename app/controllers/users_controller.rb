class UsersController < ApplicationController

	# New user alloc
	def new
	 	@user = User.new 
	end
	
	# Showing user data
	def show
		@user = User.find(params[:id])		
	end

	def login
		
	end
	
	# Creating new user
	def create

	 	@user = User.new(user_params)


		if @user.save
			flash[:notice] = 'Cadastro efetuado com sucesso!'
			redirect_to :action => "show",:id => @user.id
		else
			render :new
		end

	end

	# Searcing user to edit
	def edit
		@user = User.find(params[:id])		
	end

	# Deleting user 
	def destroy
 		@user = User.find(params[:id])
 		@user.destroy
	
		redirect_to :action => "new"

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
  	def update_password
  		@user = User.find(params[:id])
  		if @user.password == :password_old
			if @user.update_attributes(user_params)
    			respond_to do |format| format.html {redirect_to :action => "show",:id => @user.id}
    			flash[:success] = "Profile updated"
    			format.js
    		end
    		else
    			render 'edit'
      			format.js # views/users/update.js.erb
    		end
    	else	
    		render 'edit'
    	end
  	end

  	def user_params
		params[:user].permit(:name, :email, :password,:password_confirmation,:login, :dateBirthday, :gender)
	end

	def user_params_update
		params[:user].permit(:name, :email, :password,:login, :dateBirthday, :gender)
	end
end