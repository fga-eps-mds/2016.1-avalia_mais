require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe 'Routes' do
		it 'access methods create with success' do
			expect(:post => '/questions/new').to route_to(:controller => "questions",
 				 :action => "create")
			
		end
	end
	describe 'Acess instance variable in the new' do
		before('@questions') do
			@test_companies = [Company.create(name: 'test1'),
								Company.create(name: 'test2')]	
			@test_company = Company.new(name: 'test0')	
				
			@test_question = Question.new(:title => 'qual time vc torce', :company_id => @test_company.id)	
			@option = Option.new(:title => 'santos', question_id: @test_question.id)							
		end 

		it 'tested in new @questions' do
			get :new
				@questions = assigns(:question)
				expect(@test_question).to eq(@questions)
		end

		it 'tested in new @Company' do
			@test_company = @test_companies.find(@test_question_company.id)
			get :new
				@company = assigns(:company)
				expect(@company).to eq(@test_company)
		end
	end

	describe 'Acess instance variable in the create' do
		it 'testing create new question'do
			expect(post :create,{:question =>  {:title => 'testando', :company_id => @test_company.id,
					:option_attributes => [:title => @option.title, :question_id => @question.id]}}).to redirect_to('/questions/#{@question.id}')
		end				
	end
end


