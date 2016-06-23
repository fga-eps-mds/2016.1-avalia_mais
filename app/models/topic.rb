class Topic < ActiveRecord::Base
	belongs_to :company
	belongs_to :user
	has_many :comments
	has_many :denunciations
	before_create :set_create_date


#something it's wrong
=begin
	#title
	validates :title,
		presence: { :message => 'O título não pode estar vazio' }

	validates_length_of :title,
		:allow_blank => false,
		:within => 2..60,
		:too_short => 'O título deve ter no mínimo 2 caractres',
		:too_long => 'O título pode ter no máximo 60 caractres'

	#body
	validates :body,
		presence: { :message => 'O conteúdo não pode estar vazio' }

	validates_length_of :body,
		:allow_blank => false,
		:within => 2..1500,
		:too_short => 'O conteúdo deve ter no mínimo 2 caractres',
		:too_long => 'O conteúdo pode ter no máximo 1500 caractres'
=end


	private 
		def set_create_date
			self.create_date = Date.today
		end


end
