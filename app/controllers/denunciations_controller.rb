class DenunciationsController < ApplicationController
	def create
		@denunciation = Denunciation.create(topic_id: params[:session][:topic_id], user_id: params[:session][:user_id])
		if @denunciation
			redirect_to Topic.find(params[:session][:topic_id])
		else
			# error
		end
	end

	def destroy
		denunciation = Denunciation.find(params[:session][:denunciation_id])
		if denunciation.destroy
			redirect_to Topic.find(params[:session][:topic_id])
		else
			# error
		end	
	end

	def create_for_comment
		@denunciation = Denunciation.create(comment_id: params[:session][:comment_id], user_id: params[:session][:user_id])
		if @denunciation
			redirect_to Topic.find(params[:session][:topic_id])
		else
			#error
		end
	end


end