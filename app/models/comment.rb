class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic
	has_many :denunciations

	validates 	:description, :presence => { :message => 'Não é possível realizar um comentário vazio!' },length: { maximum: 150}

end
