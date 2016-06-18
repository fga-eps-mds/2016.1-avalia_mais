require 'rails_helper'
include SessionsHelper

RSpec.describe UsersController, type: :controller do
	describe 'User' do
		before(:each) do	
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)	
		end

		it 'should show topic' do
			get :show, {id: @user.id}
			expect(assigns(:user)).to eq(@user)
		end

		it 'should update user' do
			post :update, {id: @user.id, user: {name: 'NewRobot'}}
			expect(flash[:notice]).to eq('Perfil atualizado')
		end

		it 'should edit an user' do
			expect(get :edit, {id: @user.id}).to redirect_to(home_path)
		end

		it 'should destroy' do
			expect(get :destroy, {id: @user.id}).to redirect_to(home_path)
		end

		it 'should not update user password' do
			post :update_password, {id: @user.id, user: {password_older: '1234567'}}
			expect(flash[:notice]).to eq('Senha invalida!')
		end

		it 'should not update user password' do
			post :update_password, {id: @user.id, user: {password_older: 'pass', password: '123345', password_confirmation: '1234567'}}
			expect(flash[:notice]).to eq('Senha de confirmação invalida!')
		end

		it 'should update user password' do
			post :update_password, {id: @user.id, user: {password_older: 'pass', password: '123456', password_confirmation: '123456'}}
			expect(flash[:notice]).to eq('Senha atualizada com sucesso!')
		end
	end

	
	describe 'User methods create and new' do

		it 'should create a new user' do
			post :create, {user: {name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
			expect(flash[:notice]).to eq('Cadastro efetuado com sucesso!')
			expect(User.count).to be 1
		end

		it "should not create user account, miss inform name" do
			post :create, {user: { email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
			expect(User.count).to be 0
		end

		it 'should set a new user object' do
			post :create, {user: { email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
			@user_two = User.last
			get :new
			@user = assigns(:users)
			expect(@user_two).to eq(@user)
		end

		it 'should not set a new user object' do
			post :create, {user: {name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', 
				password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true}}
			expect(get :new).to redirect_to(home_path)
		end


	end
end