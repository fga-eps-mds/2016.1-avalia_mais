class CompanyController < ApplicationController
	def new
		@company = Company.new()
	end

	def show
		@company = Company.find(params[:id])
	end

	def create
		@company = Company.new(company_params)
		@company.authenticated = false

		if @company.save
			flash[:notice] = 'Cadastro efetuado com sucesso!'
			redirect_to @company
		else
			render :new
		end
	end

	def company_params
		params[:company].permit(:name, :segment_id, :address, :UF, :telephone, :email, :description)
	end

end