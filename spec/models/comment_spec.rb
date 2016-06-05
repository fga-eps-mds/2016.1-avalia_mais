require "spec_helper"
require 'rails_helper'


RSpec.describe Comment, type: :model do
	before('has a valid description') do 
		@comment = Comment.create!(:description => 'test description with a valid argument')
	end

	it 'has a valid description' do
		@comment.should be_valid
	end

end