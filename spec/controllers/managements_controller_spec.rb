require 'rails_helper'

RSpec.describe ManagementsController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
			@attachs = [Attach.create(cnpj: "123", user: @user), Attach.create(cnpj: "456", user: @user)]
		end

		context 'test routes for attachs' do
			it 'routed to correct controller and method' do
				session[:user_id] = @user.id
				expect(:get => "management/attaches").to route_to(
	 				 :controller => "managements",
	 				 :action => "list_attaches")
			end
		end	

		it 'list_attaches' do			
 			get :list_attaches
			method_attachs = assigns(:attaches).to_a
			expect(method_attachs).to eq(@attachs)
 		end
	end
end