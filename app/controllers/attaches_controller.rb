class AttachesController < ApplicationController

	def new
		@attach = Attach.new
		@company = Company.new
		@company = Company.find(params[:company_id])
	end

	def create
		@attach = Attach.new(attach_params)
		@attach.user = current_user
		#@company = Company.find(params[:company_id])


		if @attach.save
			redirect_to company_path(@attach.company_id)
			flash[:notice] = 'Solicitação feita com sucesso!'

		else
			render :new
		end
	end



	private 
		def attach_params
			params[:attach].permit(:cnpj, :address, :photo, :user_id, :company_id)
		end

end