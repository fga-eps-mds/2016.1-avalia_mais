require 'rails_helper'

RSpec.describe CompanyDenunciationsController, type: :controller do
	describe 'Company denunciation' do
		before(:each) do
			@company = Company.create(name: 'company')
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
		end

		it 'show' do
			company_denunciation = CompanyDenunciation.create(user_id: @user.id, company_id: @company.id)
			get :show, {format: company_denunciation.id}
			assigns(:company_denunciation).should eq(company_denunciation)
		end

		it 'should be created' do
			denunciations_before = CompanyDenunciation.where(company_id: @company).count
			post :create, {session: {user_id: @user.id, company_id: @company.id}}
			denunciations_after = CompanyDenunciation.where(company_id: @company).count

			expect(denunciations_after).to be > denunciations_before
		end

		it 'should be destroyed' do
			company_denunciation = CompanyDenunciation.create(user_id: @user.id, company_id: @company.id)
			denunciations_before = CompanyDenunciation.where(company_id: @company).count
			post :destroy, {session: {company_denunciation_id: company_denunciation.id, company_id: @company.id}}
			denunciations_after = CompanyDenunciation.where(company_id: @company).count

			expect(denunciations_after).to be < denunciations_before
		end

	end
end
