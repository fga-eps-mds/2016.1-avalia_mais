class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

	validates 	:description, 
				:presence => { :message => 'Não é possível realizar um comentário vazio!' },
				length: { maximum: 300}

end
