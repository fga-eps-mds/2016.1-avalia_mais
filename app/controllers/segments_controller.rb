class SegmentsController < ApplicationController
	def show_segment
		@company = Company.all.order(:name)
		@segment = Segment.all
	end
end
