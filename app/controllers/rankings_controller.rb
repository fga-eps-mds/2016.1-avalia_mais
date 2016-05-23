class RankingsController < ApplicationController
	
	def response_time_all
		@companies = Company.all.order(:response_time)

	end



end
