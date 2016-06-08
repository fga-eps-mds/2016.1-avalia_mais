class Faq < ActiveRecord::Base
	belongs_to :company
	has_many :faq_question 
	has_many :faq_answer

	has_many :faq_answer, through: :faq_question

	accepts_nested_attributes_for :faq_answer, reject_if: :all_blank, allow_destroy: true 
end
