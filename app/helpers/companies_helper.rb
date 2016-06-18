module CompaniesHelper

	def validated?
		!@company.authenticated == true
	end

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

	def denunciation_count(company)
		return CompanyDenunciation.where(company_id: company.id).count
	end

end