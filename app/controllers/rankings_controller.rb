class RankingsController < ApplicationController
	
	def response_time_all
		@companies = Company.all.order(:response_time)

	end

	def grade_all
		@companies = Company.all.order('rate DESC')
	end

	def grade_category
	  
	end
  
end
