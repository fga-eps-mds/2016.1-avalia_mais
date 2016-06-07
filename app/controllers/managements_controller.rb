class ManagementsController < ApplicationController

	def list_attaches
		#if user_admin?
			@attaches = Attach.all.order(:cnpj)			
		#else
		#	redirect_to home_path
		#end
	end

	def list_denunciations
		@topic_ordered = Topic.joins(:denunciations).select('topics.*, count(*) as denunciations_count').group('topics.id').order('denunciations_count DESC')
	end

end