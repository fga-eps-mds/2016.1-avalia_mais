class SegmentsController < ApplicationController
	def show_segment
		@company = Company.all
		@segment = Segment.all
	end
end
