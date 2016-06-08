class Question < ActiveRecord::Base
  belongs_to :company		
  has_many :option
  has_many :votes

  def votes_count
    votes.count
  end

  accepts_nested_attributes_for :option, reject_if: :all_blank, allow_destroy: true

  validates_inclusion_of :options_quantity_chosen, :in => 2..6,
  		:messege => 'Quantidade de opções deve ser entre 2 e 6'
  
  validates :title, :presence => { :message => 'Titulo não pode ser vazio!' }
end
