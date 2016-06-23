require 'test_helper'

class TopicsControllerTest < ActionController::TestCase
	def setup
		@company = companies(:one)
		@topic = topics(:one)
	end

	test "should new topic" do
		get :new, :company_id => @company.id

		assert_response :success
	end

	test "should create topic" do
		assert_difference('Topic.count') do
			post :create, topic: {title: "test", body: "test", :company_id => @company.id,
				user_id: 1}
		end
		assert_template :show
	end

	test "should show topic" do 
		#post :create, topic: {id: 1, title: "test", body: "test", :company_id => @company.id,
		#	user_id: 1}
		get :show, :id => @topic.id
		assert_response :success
		
	end
end