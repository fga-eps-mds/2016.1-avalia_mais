class CommentsController < ApplicationController

	def create
		comment = Comment.create(comment_params)
		redirect_to Topic.find(params[:comment][:topic_id])
	end

	def destroy
		comment = Comment.find(params[:format])
		topic = comment.topic_id
		comment.destroy
		redirect_to Topic.find(topic)
	end
	

	private
		def comment_params
			params[:comment].permit(:description, :user_id, :topic_id)
		end
end
