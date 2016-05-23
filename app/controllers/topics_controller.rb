class TopicsController < ApplicationController

	def index
		@company = Company.find(params[:id])
		@topics = @company.topics
	end

	def new
		@topic = Topic.new
		@company = Company.find(params[:company_id])
	end

	def create
		@topic = Topic.new(topic_params)

		if @topic.save
			render :show

		else
			render :new
		end
	end

	def show
		@topic = Topic.find(params[:id])
	end

	private
	def topic_params
		params[:topic].permit(:title, :body, :company_id)
	end
end