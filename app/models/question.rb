class Question < ActiveRecord::Base
  has_many :options
  has_many :votes

  def votes_count
    votes.count
  end

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  
end
