class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @option = Option.new
  end

  def create
    @question = Question.new(question_params)
    
    @question.save!   	

    params[:options].each do |option|
      if option[:title] != ""
        new_option = Option.new
        new_option.title = option[:title]
        new_option.question_id = @question.id
        new_option.save!
      end
    end
    redirect_to "/questions/#{@question.id}"
  end

  def show
    @question = Question.find(params[:id])
   
  end

  def results
    @question = Question.find(params[:id])
    @options = @question.options
  end

  def question_params
   	params.require(:question).permit(:title)
  end


end
