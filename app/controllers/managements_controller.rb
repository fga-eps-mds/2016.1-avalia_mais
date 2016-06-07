class ManagementsController < ApplicationController

	def list_attaches
		#if user_admin?
			@attaches = Attach.all.order(:cnpj)			
		#else
		#	redirect_to home_path
		#end
	end

	# def list_topic_denunciations
	# 	Topics.all.each do |topic|
	# 		if topic.denunciations.count > 0
	# 			@topics = @topics + topic
	# 		end	
	# 	end
	# end

end