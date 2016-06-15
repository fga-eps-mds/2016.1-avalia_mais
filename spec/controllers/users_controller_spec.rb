require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do
	describe 'User' do
		before(:each) do	
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)	
		end

		it 'should show topic' do
			expect(get :show, {id: @user.id})
		end

		it 'should update user' do
			post :update, {id: @user.id, user: {name: 'NewRobot'}}
			expect(flash[:notice]).to eq('Perfil atualizado')
		end

		it 'should edit an user' do
			expect(get :edit, {id: @user.id})
		end

		it 'should destroy' do
			expect(get :destroy, {id: @user.id}).to redirect_to(home_path)
		end

		it 'should not update user password' do
			post :update_password, {id: @user.id, user: {password: '1234567'}}
		end

		it 'should not update user password' do
			post :update_password, {id: @user.id, user: {password_older: 'pass', password: '123345', password_confirmation: '1234567'}}
		end

		it 'should update user password' do
			post :update_password, {id: @user.id, user: {password_older: 'pass'}}
		end
	end

	describe 'User methods create and new' do

		it 'should create a new user' do
			post :create, {user: {name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
		end

		it "should redirect user to sign up page, did not inform name in form" do
			post :create, {user: { email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
		end

		it 'should set a new user object' do
			expect(get :new)
		end

	end
end


# it 'comment should be deleted' do

# expect(get :destroy, {:format => @comment.id}).to redirect_to(Topic.find(@topic.id))

# end


