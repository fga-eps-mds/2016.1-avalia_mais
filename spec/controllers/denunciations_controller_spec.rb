require 'rails_helper'

RSpec.describe DenunciationsController, type: :controller do
	describe 'topic' do
		before(:each) do
			@topic = Topic.create(title: 'topic', body: 'body')
			@user = User.create(name: 'robot', email: 'robot@bot.com', gender: 'm', password: 'pass', password_confirmation: 'pass', login: 'robot', dateBirthday: "1990-05-10", active: true)
		end

		it 'should be created' do
			denunciations_before = @topic.denunciations.count
			post :create, {session: {user_id: @user.id, topic_id: @topic.id}}
			denunciations_after = @topic.denunciations.count

			expect(denunciations_after).to be > denunciations_before
		end

		it 'should be destroyed' do
			denunciation = Denunciation.create(user: @user, topic: @topic)
			denunciations_before = @topic.denunciations.count
			post :destroy, {session: {denunciation_id: denunciation.id, topic_id: @topic.id}}
			denunciations_after = @topic.denunciations.count

			expect(denunciations_after).to be < denunciations_before
		end

	end
end
