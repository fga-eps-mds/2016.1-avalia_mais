require "spec_helper"
require 'rails_helper'

RSpec.describe Topic, type: :model do
  
  describe "Topic create" do
  	
  	it "Should save a topic successfully." do
  		t = Topic.new :title => "Titulo do topico do teste Spec",
  			:body => "Conteudo do topico do teste spec"

  			t.save!

  			expect(t.save).to be(true)
  	end
  end

end


