module CompaniesHelper

	def validated?
		!@company.authenticated == true
	end

end