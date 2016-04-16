class Company < ActiveRecord::Base
	has_many :evaluations
	belongs_to :segment
	has_attached_file :logo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

	# validates :name, 
	# 	presence: { :message => "Informe o nome da empresa." },
	# 	uniqueness: { :message => "Uma empresa já foi cadastrada com esse nome."},	
	# 	length: { minimum: 2, maximum: 50 } 
		
		


	# validates :address,
	# 	length: { minimum: 3, maximum: 80 }

	# validates :description, length: { maximum: 500 }
end
