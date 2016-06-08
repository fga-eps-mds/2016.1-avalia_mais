class FaqController < ApplicationController
	def new
    @faq = Faq.new
    @company = Company.all
    @company = Company.find(params[:company_id])
    @faq_question = Faq_question.new
    @faq_answer = Faq_answer.new
  end

  def create
    @faq = Faq.new(faq_params)
    
    if @faq.save!   	
      params[:faq_question].each do |faq_question|
        if Faq_question[:title] != ""
          new_faq_question = Faq_question.new
          new_faq_question = Faq_question[:title]
          new_faq_question.faq_id = @faq.id
          new_option.save!
        end
      end
      params[:faq_answer].each do |faq_answer|
        if Faq_answer[:title] != ""
          new_faq_answer = Faq_answer.new
          new_faq_answer = Faq_answer[:title]
          new_faq_answer.faq_question_id = @faq_question.id
          new_option.save!
        end
      end
      redirect_to "/fac/#{@faq.id}"
    end
  end


	def faq_params
   		params.require(:faq).permit(:title, :company_id, :faq_answer_attributes => [:title, :faq_question_id, :faq_question_attributes => [:title, :faq_id]])

  	end
end
