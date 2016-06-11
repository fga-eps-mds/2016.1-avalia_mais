class Option < ActiveRecord::Base
	has_many :vote
  	belongs_to :question

  	
  	validates :title, :presence => { :message => 'Opção não pode ser vazia!' }
end
