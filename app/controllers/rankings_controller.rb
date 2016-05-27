class RankingsController < ApplicationController

	def response_time_all
		@segments = Segment.all.order(:name)
		@companies_unpaginated = Company.all.order(:response_time)
		@companies = @companies_unpaginated.paginate(:page => params[:page], :per_page => 15)
	end

	def response_time_segment
		@segments = Segment.all.order(:name)
		@companies = Company.all.order(:response_time)
	end

	def segment_selected
		@companies = Company.where(:segment_id => params[:segment_selected][:id]).order(:response_time).paginate(:page => params[:page], :per_page => 20)
		@segment = Segment.find(params[:segment_selected][:id])
	end

	def grade_all
		@segments = Segment.all
		@companies_unpaginated = Company.all.order('rate DESC')
		@companies = Company.all.order('rate DESC').paginate(:page => params[:page], :per_page => 20)
	end

end
