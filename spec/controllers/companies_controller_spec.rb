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

		it 'should call new' do
			get :new
			expect(assigns(:company).valid?).to be(false)
		end

		it 'should create a new company' do
			before_create = Company.all.count
			segment = Segment.create(name: 'Segment')
			uf = Uf.create(name: 'UF')

			post :create, {company:{name: 'Test', segment_id: segment.id, uf_id: uf.id}}
			after_create = Company.all.count

			expect(after_create).to be > before_create
		end

		it 'should fail creating a invalid new company' do
			before_create = Company.all.count

			post :create, {company:{name: nil, segment_id: nil, uf_id: nil}}
			after_create = Company.all.count

			expect(after_create).to eql(before_create)
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

		it 'should search a company' do
			companies = [Company.create(name: 'test01'),Company.create(name: 'test02'),Company.create(name: 'test03')]
			post :search, current_search: {search: 'test'}
			method_variable = assigns(:company)
			expect(method_variable).to eq(companies)
		end

		after(:all) do
			Rails.application.reload_routes!
		end
	end
end
DatabaseCleaner.clean