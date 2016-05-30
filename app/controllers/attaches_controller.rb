class AttachesController < ApplicationController

	def new
		@attach = Attach.new
		@company = Company.new
		@company = Company.find(params[:company_id])
	end

	def show
		@attach = Attach.find(params[:id])
	end

	def create
		@attach = Attach.new(attach_params)
		@attach.user = current_user

		if @attach.save
			redirect_to company_path(@attach.company_id)
			flash[:notice] = 'Solicitação feita com sucesso!'

		else
			render :new
		end
	end

	def approve
		 company = Company.find(params[:attach].company_id)
		 company.update_attributes(:user_id => params[:attach].user.id)
	end 

	private 
		def attach_params
			params[:attach].permit(:cnpj, :address, :photo, :user_id, :company_id)
		end

end