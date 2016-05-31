class VotesController < ApplicationController
  before_filter :set_question, only: [:show]

  def update
    question_id = params[:vote][:question_id]
    vote_id = cookies["vote_#{question_id}"]
    vote = Vote.where({id: vote_id}).first_or_initialize

    question = Question.where({id: question_id}).first
    vote.question_id = 21
    vote.option_id = Option.find(params[:vote][:option_id]).id

    if vote.save!
      cookies.permanent["vote_#{question.id}"] = vote.id

      respond_to do |format|
        format.html { redirect_to "/questions/#{question.id}" }
        format.json { render json: {}, status: :created }
      end
    end
  end

  def show
  end

  private

  def set_question
    @question = Question.where({id: params[:id]}).first
  end

  def question_params
    params.require(:question).permit(:title)
  end
end
