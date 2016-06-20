require 'rails_helper'

RSpec.describe VotesController, type: :controller do
	context 'test methods' do
		before(:each) do
			@company = Company.create(name: 'company test')
			@question = Question.create(company_id: @company.id, title: 'test')
			@option = Option.create(question_id: @question.id, title: 'test option')
		end

		it 'update should update a vote' do
			
		end
	end
end
