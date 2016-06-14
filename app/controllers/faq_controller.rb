class FaqController < ApplicationController
  
  def create
    faq = Faq.new(faq_params)
    if faq.save  
        company = Company.find(params[:faq][:company_id])
        flash[:notice] = 'Cadastrado com sucesso!'
    end	
    redirect_to company
    
  end
  def faq_params
    params[:faq].permit(:question, :answer, :company_id)
  end

end
