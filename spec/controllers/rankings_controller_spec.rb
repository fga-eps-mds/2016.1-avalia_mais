require 'rails_helper'

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
		describe 'access to instance variables' do
			it '@segments' do 
				test_segment=[Segment.create(:name => "segmento teste"),
					Segment.create(:name => "segmento teste2")]
				get :grade_all
				method_segment = assigns(:segments).to_a
				expect(method_segment).to eq(test_segment)
			end

			it '@companies' do
				# Create data test
				expected_paginate = Company.all.order('rate DESC').paginate(:page => 1, :per_page => 15)
				get :grade_all,{'page': 1}
				method_paginate = assigns(:companies)
				expect(method_paginate).to eq(expected_paginate)
			end
			it '@company in order' do

				expected_company = Company.all.order('rate DESC')
				get :grade_all
				method_company = assigns(:companies_unpaginateds).to_a
				expect(method_company).to eq(expected_company)
			end	

			it '@segments' do 
				test_segment=[Segment.create(:name => "segmento teste"),
					Segment.create(:name => "segmento teste2")]
				get :response_time_all
				method_segment = assigns(:segments).to_a
				expect(method_segment).to eq(test_segment)
			end

			it '@companies' do
				# Create data test
				expected_paginate = Company.where('response_time is not null').order(:response_time).paginate(:page => 1, :per_page => 15)
				get :response_time_all,{'page': 1}
				method_paginate = assigns(:companies)
				expect(method_paginate).to eq(expected_paginate)
			end
			it '@company in order' do

				expected_company = Company.where('response_time is not null').order(:response_time)
				get :response_time_all
				method_company = assigns(:companies_unpaginateds).to_a
				expect(method_company).to eq(expected_company)
			end		
		end
	end
end
