module CompaniesHelper

	def current_user_company_denunciation(company)
		CompanyDenunciation.find_by(user_id: current_user.id, company_id: company.id)
	end
end