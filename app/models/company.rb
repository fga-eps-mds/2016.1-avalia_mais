class Company < ActiveRecord::Base
	has_many :evaluations
	belongs_to :segment
	belongs_to :uf
	has_attached_file :logo, styles: { large: "600x600>", default: "400x400#"}, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
	validates_attachment_file_name :logo, matches: /jpe?g\Z/
	validates_with AttachmentSizeValidator, attributes: :logo, less_than: 1.megabyte
	validates_attachment :logo, presence: true, content_type: { content_type: "image/jpeg" }

	# validates :name, 
	# 	presence: { :message => "Informe o nome da empresa." },
	# 	uniqueness: { :message => "Uma empresa já foi cadastrada com esse nome."},	
	# 	length: { minimum: 2, maximum: 50 } 

	# validates :address,
	# 	length: { minimum: 3, maximum: 80 }

	# validates :description, length: { maximum: 500 }

end
