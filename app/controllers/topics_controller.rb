class TopicsController < ApplicationController

	def new
		@topic = Topic.new
		@company = Company.new
		@company = Company.find(params[:company_id])
	end

	def create
		@topic = Topic.new(topic_params)
		@topic.user = current_user

		if @topic.save
			redirect_to @topic
		else
			render :new
		end
	end

	def show
		@topic = Topic.find(params[:id])
		@comments = @topic.comments.order('id DESC')
	end

	def edit
		@topic = Topic.find(params[:id])
		if current_user != @topic.user
			redirect_to @topic
		else
			#do nothing
		end
	end

	def update
		@topic = Topic.find(params[:id])

		if @topic.update_attributes(topic_params)
    		respond_to do |format| format.html {redirect_to :action => "show",:id => @topic.id}
	    		flash[:notice] = "Tópico atualizado"
	    	end	
    	end

	end


	def destroy
		topic = Topic.find(params[:id])
		company = topic.company

		if topic.destroy
	    	flash[:notice] = "Tópico excluído!"
	    	redirect_to company
    	end

	end

	def current_user_topic_denunciation
		Denunciation.find_by(topic_id: params[:id], user: current_user)
	end

	helper_method :current_user_topic_denunciation

	def current_user_comment_denunciation(comment_id)
		Denunciation.find_by(comment_id: comment_id, user: current_user)
	end

	helper_method :current_user_comment_denunciation

	private
		def topic_params
			params[:topic].permit(:title, :body, :company_id, :user_id)
		end
end
