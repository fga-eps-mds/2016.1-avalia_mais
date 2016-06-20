module CompaniesHelper

	def current_user_company_denunciation(company)
		company_denunciation = nil
		CompanyDenunciation.all.each do |d|
			if d.user_id == current_user.id && d.company_id == company.id
				company_denunciation = d
				break
			end
		end

		return company_denunciation
	end

end