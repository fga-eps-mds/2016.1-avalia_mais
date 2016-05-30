class TopicsController < ApplicationController

=begin
	def index
		@company = Company.find(params[:id])
		@topics = @company.topics
	end
=end

	def new
		@topic = Topic.new
		@company = Company.new
		@company = Company.find(params[:company_id])
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.user = current_user

		if @topic.save
			render :show

		else
			render :new
		end
	end

	def show
		@topic = Topic.find(params[:id])
		@comments = @topic.comments 
	end

	
	private
		def topic_params
			params[:topic].permit(:title, :body, :company_id, :user_id)
		end
end
