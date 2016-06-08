class FaqAnswer < ActiveRecord::Base
	belongs_to :faq_question
	belongs_to :faq

	accepts_nested_attributes_for :faq_question, reject_if: :all_blank, allow_destroy: true 

end
