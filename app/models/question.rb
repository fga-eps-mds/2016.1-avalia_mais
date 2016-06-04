class Question < ActiveRecord::Base
  belongs_to :company		
  has_many :option
  has_many :votes

  def votes_count
    votes.count
  end

  accepts_nested_attributes_for :option, reject_if: :all_blank, allow_destroy: true
  
end
