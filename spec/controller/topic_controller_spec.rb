require "spec_helper"
require 'rails_helper'
require 'topics_controller'


RSpec.describe TopicsController, type: :controller do

    describe "Create topic" do
    	it "should show the new topic" do
    		expect {
    		@topic = Topic.create!(:title => "titulo do test", 
    			:body => "conteudo do teste")
    		}.to change(Topic,:count).by(1)
    	end
    end
end

