module TopicsHelper

	def current_user_topic_denunciation
		denunciation = nil
		@topic = Topic.find(params[:id])
		@topic.denunciations.each do |d|
			if d.user == current_user
				denunciation = d
				break
			end
		end

		return denunciation
	end

	def current_user_comment_denunciation
		denunciation = nil
		@comment = Comment.find(params[:id])
		@comment.denunciations.each do |d|
			if d.user == current_user
				denunciation = d
				break
			end
		end

		return denunciation
	end

end