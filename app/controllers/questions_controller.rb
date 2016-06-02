class QuestionsController < ApplicationController

  def new
    @question = Question.new
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
      end
      redirect_to "/questions/#{@question.id}"
    end
  end

  def show
    @question = Question.find(params[:id])
    @options = @question.options

    # params[:votes].each do |vote|
    #   if vote[:question_id] = @question.id
    #         params[:options].each do |option|

      
  end

  def results
    @question = Question.find(params[:id])
    @options = @question.options
  end

  def question_params
   	params.require(:question).permit(:title, :options_attributes => [:title, :question_id])

  end


end
