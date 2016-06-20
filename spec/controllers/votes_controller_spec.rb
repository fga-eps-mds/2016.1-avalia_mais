require 'rails_helper'

RSpec.describe VotesController, type: :controller do
	context 'test methods' do
		before(:each) do
			@company = Company.create(name: 'company test')
			@question = Question.create(company_id: @company.id, title: 'test')
			@option = Option.create(question_id: @question.id, title: 'test option')
		end

		it 'update should update a vote' do
			before_count = Vote.all.count
			get :update, {question_id: @question.id, vote:{question_id: @question.id, option_id: @option.id}}
			after_count = Vote.all.count
			expect(before_count).to be < after_count
		end
	end
end
