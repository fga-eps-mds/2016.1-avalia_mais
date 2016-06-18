class CommentsController < ApplicationController

	def create
		comment = Comment.create(comment_params)
		redirect_to Topic.find(params[:comment][:topic_id])
	end

	def edit
		comment = Comment.find(params[:comment][:comment_id])
		edit_comment_params(comment)
		redirect_to Topic.find(comment.topic_id)
	end

	def destroy
		comment = Comment.find(params[:format])
		topic = comment.topic_id
		comment.denunciations.delete_all
		comment.destroy
		redirect_to Topic.find(topic)
	end
	

	private
		def comment_params
			params[:comment].permit(:description, :user_id, :topic_id)
		end

		def edit_comment_params(comment)
			comment.update_attributes(:description => params[:comment][:new_description])
		end
end
