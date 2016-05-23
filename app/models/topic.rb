class Topic < ActiveRecord::Base
	belongs_to :company

	before_create :set_create_date

	private 
		def set_create_date
			self.create_date = Date.today
		end


end
