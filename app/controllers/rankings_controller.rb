class RankingsController < ApplicationController

	def response_time_all
		@companies = Company.all.order(:response_time)

	end

	def grade_all
		@segments = Segment.all
		@companies_unpaginated = Company.all.order('rate DESC')
		@companies = Company.all.order('rate DESC').paginate(:page => params[:page], :per_page => 20)
	end
  
end
