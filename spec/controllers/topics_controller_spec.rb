require 'rails_helper'

RSpec.describe TopicsController, type: :controller do
	describe 'topic' do
		before(:each) do
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
			@company = Company.create(name: 'company')
			@topic = Topic.create(title: 'test', company: @company, user: @user)
		end

		it 'have a new instance' do
			expect(get :new, {company_id: @company.id})
		end

		it 'show a topic' do
			expect(get :show, {id: @topic.id})
		end

		it 'should create a new topic' do
			post :create, {topic: {title: 'new'}}
		end

		it 'routed to correct controller and view show' do
			expect(:get => topic_path(@topic)).to route_to(
 				 :controller => "topics",
 				 :action => "show", :id => @topic.id.to_s)
		end

		it 'destroy a topic' do
			post :destroy, {id: @topic.id}

			expect(flash[:notice]).to eq "Tópico excluído!"
		end

		it 'should update a topic' do
			post :update, {id: @topic.id, topic: {title: 'new'}}

			expect(flash[:notice]).to eq "Tópico atualizado"
		end

		it 'should edit a topic' do
			expect(get :edit, {id: @topic.id}).to redirect_to(topic_path(@topic))


		end

		it 'shoud return topic denunciated by user' do
			:current_user_topic_denunciation
		end

		it 'should return comment denunciated by user' do
			:current_user_comment_denunciation
		end

		after :all do
		 Rails.application.reload_routes!
		end
	end
end
