require 'rails_helper'
#include SessionsHelper

RSpec.describe AttachesController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true, admin: true)
			@company = Company.create(name: 'company')
			@attach = Attach.create(user: @user, company: @company)
			#SessionsHelper.log_in(@user)
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
		end

		it 'reject attach' do
			get :reject, {:format => @attach.id}
			expect(flash[:notice]).to eq "Vínculo rejeitado com sucesso!"
		end

		it 'set a new attach' do
			expect(get :new, {company_id: @company.id})
		end

		it 'show the attach' do
			expect(get :show, {id: @attach.id})
		end

		it 'should create a new attach' do
			post :create, {:attach =>  {:address => 'Rua do comercio', :company_id => @company.id}}
		end
	end
end
