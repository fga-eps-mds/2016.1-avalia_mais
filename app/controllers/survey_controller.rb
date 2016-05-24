class SurveyController < ApplicationController

	def new
		@survey = Survey.new
	end

	def create
		@survey = Survey.new(survey_params)

		if @Survey.save
			flash[:notice] = 'Enquete efetuado com sucesso!'
		else
			render :new
		end
	end

	def survey_params
		params[:surveys].permit(:name, :desciption)
	end

end
