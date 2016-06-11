require 'rails_helper'
require 'spec_helper'
require 'faq_controller'
require 'database_cleaner'

RSpec.describe FaqController, type: :controller do
	describe 'faq' do
		before(:each) do
			@company = Company.create(name: 'company')
		end

		it 'should create a new faq' do
			post :create, {faq: {question: 'estado civil', answer: 'solteiro', company_id: @company.id}}
			expect(flash[:notice]).to eq "Cadastrado com sucesso!"
		end
		it 'routed to correct controller and view show' do
			expect(:post => '/company/faq').to route_to(:controller => "faq",
 				 :action => "create")
		end

	end

end
