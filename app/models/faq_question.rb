class FaqQuestion < ActiveRecord::Base
	belongs_to :Faq

	accepts_nested_attributes_for :faq_answer, reject_if: :all_blank, allow_destroy: true 
end
