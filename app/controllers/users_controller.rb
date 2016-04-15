class UsersController < ApplicationController
	def new
	 	@user = User.new 
	end
	
	def show
		@user = User.find(params[:id])		
	end

	def create
	 	@user = User.new(user_params)
		if @user.save
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
		params[:user].permit(:name, :email, :password, :login, :dateBithday, :gender)
	end

	def update

    	@user = User.find(params[:id])

    	if @user.update_attributes(user_params)
    		redirect_to :action => "show",:id => @user.id
    		flash[:success] = "Profile updated"
    	else
      		render 'edit'
    	end
  	end
end