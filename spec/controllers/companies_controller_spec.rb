require 'rails_helper'
require 'spec_helper'
RSpec.describe CompaniesController, type: :controller do
	describe 'company' do
		before(:each) do
			@company = Company.create(name: 'company', rate: 3)
		end

		it 'show a company' do
			expect(get :show, {id: @company.id})
			expect(@company.rate).to eq(3)
		end

		it 'should be redirected to edit page' do
			post :edit, :company => {:id => @company.id}
			local_company = Company.find(@company.id)
			method_variable = assigns(:company)
			expect(method_variable).to eq(local_company)
		end

	end
end