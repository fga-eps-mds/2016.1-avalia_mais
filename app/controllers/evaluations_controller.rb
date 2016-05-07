class EvaluationsController < ApplicationController
	def new 
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.new(rate_params)
	end

	def rate
		evaluation = Evaluation.where(	"user_id LIKE :user_id and company_id LIKE :company_id",
									 	:user_id => "%#{params[:evaluations][:user_id]}%",
									 	:company_id =>"%#{params[:evaluations][:company_id]}%")
		company = Company.find_by(id: params[:evaluations][:company_id])
		if evaluation.present?
			#update evaluation
			evaluation.update_all(:rate => params[:evaluations][:rate])
			flash[:notice] = 'Avaliação alterada com sucesso!'
		else
			#create evaluation
			evaluation = Evaluation.new(rate_params)
			if evaluation.save
				flash[:notice] = 'Avaliação realizada com sucesso!'
			end
		end
		redirect_to company
	end

	def response_time
		evaluation = Evaluation.where(	"user_id LIKE :user_id and company_id LIKE :company_id",
									 	:user_id => "%#{params[:response][:user_id]}%",
									 	:company_id =>"%#{params[:response][:company_id]}%")
		company = Company.find_by(id: params[:response][:company_id])
		if evaluation.present?
			#update evaluation
			evaluation.update_all(:response_time => params[:response][:response_time])
			flash[:notice] = 'Sua avaliação por tempo de resposta foi realizada com sucesso!'
		else
			#create evaluation
			evaluation = Evaluation.new(response_params)
			evaluation.save
		end
		redirect_to company
	end

	def rate_params
		params[:evaluations].permit(:rate, :company_id, :user_id)
	end
	def response_params
		params[:response].permit(:response_time, :company_id, :user_id)
	end
	
end
