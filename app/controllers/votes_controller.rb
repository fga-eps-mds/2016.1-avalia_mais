class VotesController < ApplicationController
  #
  def update
    @vote = Vote.new(vote_params)
    @vote.question_id = params[:question_id]
    @vote.option_id = params[:vote][:option_id]
    if @vote.save
      redirect_to "/questions/#{@vote.question_id}/results" 
    end 
  end

  private

    def vote_params
      params[:vote].permit(:question_id, :option_id)
    end
end
