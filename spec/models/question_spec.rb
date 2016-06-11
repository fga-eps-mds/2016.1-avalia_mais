require 'rails_helper'

RSpec.describe Question, type: :model do
  context "validade de uma question" do
  	it "question valida?" do
  		question = Question.new
  		question.title = "Qual time você toce"

  		expect(question.valid?).to be_truthy
  	end

  	it "question invalida?" do
  		question = Question.new
  		question.title = nil

  		expect(question.valid?).to be_falsey
  	end
  end	
end
