require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
	describe 'Routes' do
		it 'should access new method' do
			expect(:post => 'questions/new').to route_to(:controller => "questions",
 				 :action => "new")
		end

		it 'access methods create with success' do
			expect(:get => '/questions/create').to route_to(:controller => "questions",
 				 :action => "create")
			
		end

	end

	describe 'Acess instance variable' do
		before('@questions') do
			@test_companies = [Company.create(name: 'test1'),
								Company.create(name: 'test2')]	
			@test_company = Company.create(name: 'test0')	
			@test_question = Question.create(:title => 'qual time vc torce', :company_id => @test_company.id)	
			@option = Option.create(:title => 'santos', question_id: @test_question.id)	
									
		end 

		it 'should be redirected to edit page' do
			post :new, :question => {:company_id => @test_question.company_id}
			local_company = Company.find(@test_question.company_id)
			method_variable = assigns(:company)
			expect(method_variable).to eq(local_company)
		end

		it 'should create a question' do
			count_before = Question.all.count
			post :create, {question: {title: "Title", company_id: @test_question.company_id}}
			count_after = Question.all.count
			expect(count_after).to be > count_before
		end
		
	end

	describe 'redirect show' do
		before('@questions') do
			@question_test = Question.create(title: 'teste')
									
		end

		it 'show a question' do
			expect(get :show, {id: @question_test.id})
		end
	end	
	
	describe 'results question' do
		before('results') do
			@test_company = Company.create(name: 'test0')
			@test_question = Question.create(:title => 'qual time vc torce', :company_id => @test_company.id)
			@option = Option.create(:title => 'santos', question_id: @test_question.id)	
    		@votes = Vote.create(:question_id => @test_question.id, :option_id => @option.id)
    
		end
		
		it 'results find question' do
			
			get :results, {:id => @test_question.id}
			@question = assigns(:question)
			expect(@question).to eq(@test_question)
		end	

		it 'results option' do
			get :results, {:id => @test_question.id}
			@option_method = assigns(:options)
			expect(@option_method).to eq(@test_question.option)
		end	

		it 'results votes' do
			get :results, {:id => @test_question.id}
			@votes_method = assigns(:votes)
			expect(@votes_method).to eq(@test_question.votes)
		end							
	end

end


