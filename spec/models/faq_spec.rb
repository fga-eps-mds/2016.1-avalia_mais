require 'rails_helper'

RSpec.describe Faq, type: :model do
  context "validade de uma faq" do
  	it "fq valida?" do
  		faq = Faq.new
  		faq.question = "Qual time você toce"
  		faq.answer = "Santos"

  		expect(faq.valid?).to be_truthy
  	end

  	it "faq invalida?" do
  		faq = Faq.new
  		faq.question = "Qual time você toce"

  		expect(faq.valid?).to be_falsey
  	end
  end		
end
