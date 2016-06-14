require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do
	describe 'topic' do
		before(:each) do
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
			@company = Company.create(name: 'company')
			@topic = Topic.create(title: 'test', company: @company, user: @user)
		end

		it 'should create a new user' do
			post :create, {user: {name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
			log_in @user
			expect(response).to have_http_status(:created)
		end

	end
end
