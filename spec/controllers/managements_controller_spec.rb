require 'rails_helper'

RSpec.describe ManagementsController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(id: 1, name: "admin", login: "admin", password: "12345", password_confirmation: "12345", email: "admin@email.com", gender: "m", admin: true, active: true, dateBirthday: "10-01-1990")
			@attachs = [Attach.create(cnpj: "123", user: @user), Attach.create(cnpj: "456", user: @user)]
		end

		context 'test routes for attachs' do
			it 'routed to correct controller and method' do
				expect(:get => "management/attaches").to route_to(
	 				 :controller => "managements",
	 				 :action => "list_attaches")
			end
		end	

		it 'list_attaches' do			
 			get :list_attaches
			method_attachs = assigns(:attaches).to_a
			expect(method_segment).to eq(@attachs)
 		end
	end
end