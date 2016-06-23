require 'rails_helper'
require 'spec_helper'

RSpec.describe SegmentsController, type: :controller do
	it 'should access show_segment method' do
		expect(get: '/segments/show_segments').to route_to(controller: 'segments', action: 'show_segment')
	end
	before(:each) do
		@companies = [Company.create(name: '1test'), Company.create(name: '0test')]
		@segments = [Segment.create(name: 'first'), Segment.create(name: 'second')]
	end
	it 'should took all companies order by name' do
		@companies_order = [@companies[1], @companies[0]]
		get :show_segment
		method_companies = assigns(:company)
		expect(method_companies).to eq(@companies_order)
	end
	it 'should took all segments' do
		@test_segments = Segment.all
		get :show_segment
		method_segments = assigns(:segment)
		expect(method_segments).to eq(@test_segments)
	end
end
