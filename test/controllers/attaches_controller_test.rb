require 'test_helper'

class AttachesControllerTest < ActionController::TestCase
	def setup
		@company = companies(:one)
	end

	test "should new attach" do
		get :new, :company_id => @company.id
		assert_response :success
	end

	test "should create attach" do
		assert_difference('Attach.count') do
			post :create, attach: {cnpj: "123432", address: "test test", :company_id => @company.id,
				user_id: 1}
		end
	end
end