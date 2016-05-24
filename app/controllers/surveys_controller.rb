class SurveysController < ApplicationController

	def new
		@survey = Survey.new
	end

	def create
		@survey = Survey.new(survey_params)

		if @survey.save
			flash[:notice] = 'Enquete criada com sucesso!'
			redirect_to home_path
		else
			render :new
		end
	end

	def list
		@surveys = Survey.all
	end

	def show
		@survey = Surveys.find(params[:id])
	end

	def edit
	end

	def update
		@survey = Surveys.find(params[:id])

		   if @surveys.update_attributes(survey_param)
		      redirect_to home_path
		   else

   		   end
	end

   def delete
   end

	def survey_params
		#params.require(:survey).permit(:name, :desciption)

		params[:survey].permit(:title, :description, :options_quantity, :total)

	end

end
