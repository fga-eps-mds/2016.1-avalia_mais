require 'rails_helper'

RSpec.describe AttachesController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(id: 1, name: "admin", login: "admin", password: "12345", password_confirmation: "12345", email: "admin@email.com", gender: "m", admin: true, active: true, dateBirthday: "10-01-1990")
			@company = Company.create(id: 10)
			@attach = Attach.create(company_id: @company.id, user_id: @user.id)
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

		it 'approve attach' do
			get :approve, {:format => @attach.id}
			expect(flash[:notice]).to eq "Empresa vinculada com sucesso!"
			#get :approve, {:format => @user.id}
			#method_attach = assigns(:attach)
			#expect(method_attach).to eq(test_attach)
		end

		it 'reject attach' do
			get :reject, {:format => @attach.id}
			expect(flash[:notice]).to eq "Vínculo rejeitado com sucesso!"
		# 	get :approve
		# 	method_company = assigns(:company)
		# 	expect(method_company).to eq(@company)
		end
	end
end