require 'rails_helper'
require 'attaches_controller'
require 'sessions_controller'
RSpec.describe AttachesController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(name: "admin", login: "admin", password: "12345", password_confirmation: "12345", email: "admin@email.com", gender: "m", admin: true, active: true, dateBirthday: "10-01-1990")
			@company = Company.create(name: 'Company')
			#session[:user_id] =  @user.id
		end

		context 'test routes for attachs' do
			it 'routed to correct controller and method' do
				expect(:get => "management/attachs_approve").to route_to(
	 				 :controller => "attaches",
	 				 :action => "approve")
			end

			it 'routed to correct controller and methods' do
				expect(:get => "management/attachs_reject").to route_to(
	 				 :controller => "attaches",
	 				 :action => "reject")
			end
		end

		context 'access to instance variables' do
			it 'attach' do
				test_attach = Attach.create(:cnpj => "1", :address => "Test", :company_id => @company.id)
				get :approve, {:format => @user.id}
				method_attach = assigns(:attach)
				expect(method_attach).to eq(test_attach)
			end

			it 'company' do
				get :approve
				method_company = assigns(:company)
				expect(method_company).to eq(@company)
			end




		end
	end
end