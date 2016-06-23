require 'rails_helper'

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
RSpec.describe RankingsController, type: :controller do
	
	describe 'testing ranking page' do
		it 'routed to correct controller and method' do
			expect(:get => "/ranking/grade/all").to route_to(
 				 :controller => "rankings",
 				 :action => "grade_all")
			
		end
		it 'routed to correct controller and response_time method' do
			expect(:get => '/ranking/response/all').to route_to(
				:controller => 'rankings',
				:action => 'response_time_all')
		end
		before('@segments') do
			@test_segment_disorder = [	Segment.create(:name => 'b'),
										Segment.create(:name => 'a')]
			@test_segment_order = [Segment.find_by_name('a'), Segment.find_by_name('b')]
		end
		
		describe 'access to instance variables' do
			#method grade_all
			it 'should order segments by name for grade_all method' do 
				get :grade_all
				method_segment = assigns(:segments)
				expect(method_segment).to eq(@test_segment_order)
			end

			it 'should paginate companies order by rate' do
				# Create data test
				16.times do |i|
					Company.create(:name => 'test'+i.to_s,:rate => i, :response_time => (16-i))

				end
				expected_page_2 = [Company.find_by_name('test0')]
				get :grade_all,{ page: 2}
				method_paginate = assigns(:companies)
				expect(method_paginate).to eq(expected_page_2)
			end

			it 'should order companies by rate' do
				disorder_companies = [Company.create(name: 'test0', rate: 2, response_time: 4),
										Company.create(name: 'test2', rate: 5, response_time: 3)]
				order_companies = [Company.find_by(rate: 5),
										Company.find_by(rate: 2)]
				get :grade_all
				method_company = assigns(:companies_unpaginated)
				expect(method_company).to eq(order_companies)
			end	

			#method response_time_all
			it 'should order segments by name for response_time_all method' do 
				get :response_time_all
				method_segment = assigns(:segments).to_a
				expect(method_segment).to eq(@test_segment_order)
			end

			it 'should paginate companies order by response time' do
				# Create data test
				16.times do |i|
					Company.create(:name => 'test'+i.to_s,:rate => i, :response_time => (16-i))

				end
				expected_page_2 = [Company.find_by_name('test0')]
				get :response_time_all,{page: 2}
				method_paginate = assigns(:companies)
				expect(method_paginate).to eq(expected_page_2)
			end

			it 'should order companies by response time' do
				disorder_companies = [Company.create(name: 'test0', rate: 2, response_time: 4),
										Company.create(name: 'test2', rate: 5, response_time: 3)]
				order_companies = [Company.find_by(response_time: 3),
										Company.find_by(response_time: 4)]
				get :response_time_all
				method_company = assigns(:companies_unpaginated)
				expect(method_company).to eq(order_companies)
			end		
		end
	end
end
DatabaseCleaner.clean
