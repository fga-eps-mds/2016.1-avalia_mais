class QuestionsController < ApplicationController

  before_filter :set_question, only: [:show, :results]

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

  end

  def show
   
  end

  def results
    @options = @question.options
  end




end
