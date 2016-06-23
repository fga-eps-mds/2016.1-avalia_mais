require 'rails_helper'

RSpec.describe Option, type: :model do

  context "validade de uma option" do
  	it "option valida?" do
  		option = Option.new
  		option.title = "santos"
  		expect(option.valid?).to be_truthy
  	end

  	it "option invalida?" do
  		option = Option.new
  		option.title = nil

  		expect(option.valid?).to be_falsey
  	end
  end	
end
