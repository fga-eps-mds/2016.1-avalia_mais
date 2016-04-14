class Company < ActiveRecord::Base
	has_many :evaluations
	belongs_to :segment
end
