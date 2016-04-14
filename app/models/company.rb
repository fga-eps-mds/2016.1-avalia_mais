class Company < ActiveRecord::Base
	has_many :evaluations
	belongs_to :segment
	
	validates :name, 
		presence: { :message => "Informe o nome da empresa." },
		uniqueness: { :message => "Uma empresa já foi cadastrada com esse nome."},	
		length: { minimum: 2, maximum: 50 } 
		
		


	validates :address,
		length: { minimum: 3, maximum: 80 }

	validates :description, length: { maximum: 500 }
end
