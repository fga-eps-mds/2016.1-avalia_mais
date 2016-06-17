require 'rails_helper'
require 'spec_helper'


RSpec.describe EvaluationsController, type: :controller do 
	before(:each) do
		@test_company = Company.create(name: 'test company')
		@test_user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)	

	end
	describe 'Routes access' do
		it 'should access rate method' do
			expect(post: '/company/show').to route_to(controller: 'evaluations', action: 'rate')
		end
		it 'should access response_time method' do
			expect(post: '/company/response').to route_to(controller: 'evaluations', action: 'response_time')
		end
	end
	describe 'Rate method' do
		context 'to create a new evaluation by rate' do
			it 'current user should evaluate a company' do
				post :rate, evaluations: {user_id: @test_user.id, company_id: @test_company.id, grade: 5}
				expect(flash[:notice]).to eq('Avaliação realizada com sucesso!')
			end
		end
		context 'to change the current evaluation by rate' do
			before(:each) do
				@test_evaluation = Evaluation.create(user_id: @test_user.id, company_id: @test_company.id, grade: 5)
			end
			it 'current user should change his evaluation' do
				post :rate, evaluations: {user_id: @test_user.id, company_id: @test_company.id, grade: 6}
				expect(flash[:notice]).to eq('Avaliação alterada com sucesso!')
			end
		end
	end
	describe 'Response_time method' do
		context 'to create a new evaluation by response time' do
			it 'current user should evaluate a company by response' do
				post :response_time, response: {user_id: @test_user.id, company_id: @test_company.id, response_time: 5}
				expect(flash[:notice]).to eq('Avaliação por tempo de resposta realizada com sucesso!')
			end
		end
		context 'to change the current evaluation by response time' do
			before(:each) do
				@test_evaluation = Evaluation.create(user_id: @test_user.id, company_id: @test_company.id, response_time: 5)
			end
			it 'current user should change his evaluation by response time' do
				post :response_time, response: {user_id: @test_user.id, company_id: @test_company.id, response_time: 6}
				expect(flash[:notice]).to eq('Avaliação por tempo de resposta alterada com sucesso!')
			end
		end
	end
	
end