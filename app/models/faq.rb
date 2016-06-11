class Faq < ActiveRecord::Base
	belongs_to :company

	validates :question, presence: true
 	validates :answer, presence: true
end
