class Uf < ActiveRecord::Base
	has_many :evaluations
	has_many :companies
end
