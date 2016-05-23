class TopicsController < ApplicationController

	def new
		@topic = Topic.new
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
		params[:topic].permit(:title, :body)
	end
end