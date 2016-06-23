require 'rails_helper'

RSpec.describe ManagementsController, type: :controller do
	describe 'attach' do
		before(:each) do
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
			@user2 = User.create(name: 'robots', email: 'robots@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robots', dateBirthday: "1990-05-10", active: true)
			@attachs = [Attach.create(cnpj: "123", user: @user), Attach.create(cnpj: "456", user: @user)]
			@company = Company.create(name: 'company test')
		end

		context 'test routes for attachs' do
			it 'routed to correct controller and method' do
				session[:user_id] = @user.id
				expect(:get => "management").to route_to(
	 				 :controller => "managements",
	 				 :action => "index")
			end
		end	

		it 'should order attaches' do			
 			get :index
			method_attachs = assigns(:attaches).to_a
			expect(method_attachs).to eq(@attachs)
 		end

 		it 'should be order by id' do
			denunciation = [CompanyDenunciation.create(user_id: @user.id, company_id: @company.id), CompanyDenunciation.create(user_id: @user2.id, company_id: @company.id)]			
			company_denunciations = CompanyDenunciation.all.order(:id)
			get :index
			method_variable = assigns(:denunciations)
			expect(method_variable).to eq(company_denunciations)
		end

 		it 'should order topics by denunciations count' do
 			second_user = User.create(name: 'second', email: 'second@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
 			topic1 = Topic.create(title: 'title1', body: 'body1')
 			topic2 = Topic.create(title: 'title2', body: 'body2')
 			Denunciation.create(topic_id: topic1.id, user_id: @user.id)
 			Denunciation.create(topic_id: topic2.id, user_id: @user.id)
 			Denunciation.create(topic_id: topic2.id, user_id: second_user.id)

 			expected_order = [topic2, topic1]

 			get :index

 			topics_ordered_by_method = assigns(:topic_ordered).to_a
 			expect(topics_ordered_by_method).to eql(expected_order)
 		end
	end
end