class CompanyDenunciationsController < ApplicationController
	def create
		@company_denunciation = CompanyDenunciation.create(company_id: params[:session][:company_id], user_id: params[:session][:user_id], description: params[:session][:description])
		if @company_denunciation
			redirect_to Company.find(params[:session][:company_id])
			flash[:notice] = 'Sua denúncia foi efetuada com sucesso!'
		else
			# error
		end
	end

	def show
		@company_denunciation = CompanyDenunciation.find(params[:format])
	end

	def destroy
	 	company_denunciation = CompanyDenunciation.find(params[:session][:company_denunciation_id])
	 	if company_denunciation.destroy
	 		redirect_to Company.find(params[:session][:company_id])
	 		flash[:notice] = 'Sua denúncia foi retirada com sucesso!'
	 	else
	 		# error
	 	end	
	end
end
