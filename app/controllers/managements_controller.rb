class ManagementsController < ApplicationController

	def index
		@attaches = Attach.all.order(:cnpj)	
		@topic_ordered = Topic.joins(:denunciations).select('topics.*, count(*) as denunciations_count').group('topics.id').order('denunciations_count DESC')
		comment_ordered
		@denunciations = CompanyDenunciation.all.order(:id)
	end

	def comment_ordered
		@comment_ordered = Comment.joins(:denunciations).select('comments.*, count(*) as denunciations_count').group('comments.id').order('denunciations_count DESC')
	end
	
end