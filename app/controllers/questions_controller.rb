class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @company = Company.all
    @company = Company.find(params[:com])
    @question.options_quantity_chosen = 2
    @option = Option.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save!   	

      params[:options].each do |option|
        if option[:title] != ""
          new_option = Option.new
          new_option.title = option[:title]
          new_option.question_id = @question.id
          new_option.save!
        end

        redirect_to "#{@question.company_id}/questions/#{@question.id}"

      end

    end
  end

  def show
    @question = Question.find(params[:id])  
  end

  def results
    @question = Question.find(params[:id])
    @votes = @question.votes
    @options = @question.option 
  end

  def question_params
   	params.require(:question).permit(:title, :options_attributes => [:title, :question_id, :company_id])

  end


end
