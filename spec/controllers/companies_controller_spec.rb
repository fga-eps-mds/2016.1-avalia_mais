require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
	describe 'company' do
		before(:each) do
			@company = Company.create(name: 'company', rate: 3)
		end

		it 'show a company' do
			expect(get :show, {id: @company.id})
			expect(@company.rate).to eq(3)
		end
	end
end