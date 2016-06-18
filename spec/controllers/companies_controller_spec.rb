require 'rails_helper'
require 'spec_helper'
require 'database_cleaner'
include SessionsHelper

DatabaseCleaner.strategy = :truncation
RSpec.describe CompaniesController, type: :controller do
	describe 'Routes' do
		it 'should access edit method' do
			expect(:post => 'company/edit').to route_to(:controller => "companies",
 				 :action => "edit")
		end

		it 'should access update method' do
			expect(:post => '/company/update').to route_to(:controller => "companies",
 				 :action => "update")
		end

	end

	describe 'company' do
		before(:each) do
			@company = Company.create(name: 'company', rate: 3)
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
		end

		it 'show a company' do
			expect(get :show, {id: @company.id})
			expect(@company.rate).to eq(3)
		end

		it 'should be redirected to edit page' do
			log_in @user
			post :edit, :company => {:id => @company.id}
			local_company = Company.find(@company.id)
			method_variable = assigns(:company)
			expect(method_variable).to eq(local_company)
		end

		it 'should edit an company attribute' do
			post :update, company: {name: 'changed name', id: @company.id}
			expect(flash[:notice]).to eq("Atributo atualizado com sucesso")
		end

		it 'should not edit an company attribute' do
			local_company = Company.create(name: 'error to update')
			post :update, company: {name: 'error to update', id: @company.id}
			expect(flash[:notice]).to eq("Erro ao atualizar o atributo!")
		end

	end
end
DatabaseCleaner.clean