class CompaniesController < ApplicationController

	# before_filter :authorize, only: [:create, :new]

	def new
		@company = Company.new()
		redirect_to login_path, alert: "Para cadastrar uma empresa é preciso estar logado" if current_user.nil?
	end

	def switchTypeImage(total)
		imageName = ""
		if total >= 4
			imageName = "gold_medal.png"
		elsif total <=3.99 && total >=2.49
			imageName = "silver_medal.png"
		else
			imageName = "bronze_medal.png"
		end
		return imageName
	end

	def show
		@company = Company.find(params[:id])
		if !@company.rate.nil?
			@total_evaluations = @company.rate
			@image_name = switchTypeImage(@total_evaluations)
		end
		if logged_in?
			@current_evaluation = current_user.evaluations.find_by(company_id: @company.id)
		end
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

	def edit
		@company = Company.find(params[:company][:id])
		if @company.user_id != current_user.id
			redirect_to home_path
		end
	end
	
	def update
		@company = Company.find(params[:company][:id])
		if @company.update_attributes(edit_company_params)
			flash[:notice] = 'Atributo atualizado com sucesso'
		else
			flash[:notice] = 'Erro ao atualizar o atributo!'
		end
		render :edit
	end

	def search
		@search_param = params[:current_search][:search]
  		@company = Company.where("name LIKE :search", :search => "%#{params[:current_search][:search]}%")
	end

	def company_params
		params[:company].permit(:name, :segment_id, :address, :telephone, :email, :description, :logo, :uf_id)
	end

	private
		def edit_company_params
			params[:company].permit(:name, :address, :telephone, :email, :description, :logo, :uf_id)
		end
end