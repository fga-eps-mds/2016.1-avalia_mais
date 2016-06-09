class QuestionsController < ApplicationController

  def new
    @question = Question.new
    @company = Company.all
    @company = Company.find(params[:company_id])
    @question.options_quantity_chosen = 2
    @option = Option.new
  end

  def create
    @question = Question.new(question_params)
    
    if @question.save! 
      redirect_to "/questions/#{@question.id}"  	
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
   	params.require(:question).permit(:title, :company_id, :option_attributes => [:title, :question_id])

  end


end
