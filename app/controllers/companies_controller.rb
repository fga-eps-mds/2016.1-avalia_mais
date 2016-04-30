class CompaniesController < ApplicationController
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
	
	def search
  		#company = Company.find_by(name: params[:company][:name])
  		@company = Company.where("name LIKE :search", :search => "%#{params[:company][:search]}%")
  		render "search"
  		
	end

	def company_params
		params[:company].permit(:name, :segment_id, :address, :telephone, :email, :description, :logo, :uf_id)
	end

end