require 'rails_helper'

RSpec.describe TopicsHelper, type: :helper do
	describe 'topic' do
		before(:each) do
			@topic = Topic.create(title: 'test', body: 'body')
		end

		it 'verify if user denunciated topic' do
			helper.current_user_topic_denunciation
		end
	end
end