class UsersController < ApplicationController
	def new
	 	@user = User.new 
	end
	
	def show
		@user = User.find(params[:id])		
	end

	def login
		
	end
	
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

	def edit
		@user = User.find(params[:id])		
	end

	def user_params
		params[:user].permit(:name, :email, :password, :password_confirmation,:login, :dateBirthday, :gender)
	end
	def user_params_update
		params[:user].permit(:name, :email, :password,:login, :dateBirthday, :gender)
	end

	def destroy
 		@user = User.find(params[:id])
 		@user.destroy
	
		redirect_to :action => "new"

	end

	def update

    	@user = User.find(params[:id])

    	if @user.update_attributes(user_params_update)
    		redirect_to :action => "show",:id => @user.id
    		flash[:success] = "Profile updated"
    	else
      		render 'edit'
    	end
    	
  	end
end