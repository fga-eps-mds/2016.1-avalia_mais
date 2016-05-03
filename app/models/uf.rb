class Uf < ActiveRecord::Base
	has_many :evaluations
	has_many :companies
	has_many :users
end
