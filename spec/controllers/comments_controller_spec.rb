require 'rails_helper'
require 'comments_controller'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
RSpec.describe CommentsController, type: :controller  do
	describe 'Routes' do
		it 'access methods routes with success' do
			expect(:post => '/comment').to route_to(:controller => "comments",
 				 :action => "create")
			expect(:post => '/comment/edit').to route_to(:controller => "comments",
 				 :action => "edit")
			expect(:get => '/comment/delete').to route_to(:controller => "comments",
 				 :action => "destroy")
		end
	end
	describe 'Acess instance variables' do
		before(:each) do
			@user = User.create(:id => 1, :name => "admin", :login => "admin", :password => "12345", :password_confirmation => "12345", :email => "admin@email.com",
			:gender => "m", :admin => true, :active => true, :dateBirthday =>"10-01-1990",
			:uf_id => "1")
			@topic  = Topic.create()
		end
		before(:each) do
			@comment = Comment.create(:description => 'test', :topic_id => @topic.id, :user_id => @user.id)
		end
		context 'into create method,' do 

			
			it 'comment should be created' do

				expect(post :create,{:comment =>  {:description => 'test', :user_id => @user.id,
					:topic_id => @topic.id}}).to redirect_to(Topic.find(@topic.id))
			end
		end
		context 'into edit method,' do

			it 'comment should be edited' do

				expect(post :edit, comment: {   comment_id: @comment.id, 
												new_description: 'new description'}).to redirect_to(Topic.find(@comment.topic))
			end
		end

		context 'into delete method' do
			
			it 'comment should be deleted' do

				expect(get :destroy, {:format => @comment.id}).to redirect_to(Topic.find(@topic.id))
				
			end
		end

	end
end
DatabaseCleaner.clean