class Question < ActiveRecord::Base
  belongs_to :company		
  has_many :option
  has_many :votes

  accepts_nested_attributes_for :option, reject_if: :all_blank, allow_destroy: true
  
  validates :title, :presence => { :message => 'Titulo não pode ser vazio!' }
end
