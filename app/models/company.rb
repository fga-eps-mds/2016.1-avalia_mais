class Company < ActiveRecord::Base
    has_many :evaluations
    has_many :questions
    has_many :faq
    belongs_to :segment
    belongs_to :user
    has_many :topics
    has_many :attaches
    has_many :company_denunciations

    #validations to register a company
    #image logo
    has_attached_file :logo, styles: {default: "400x400#"}, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
    validates_attachment_file_name :logo, matches: /jpe?g\Z/
    validates_with AttachmentSizeValidator, attributes: :logo, less_than: 1.megabytes
    validates_attachment :logo, content_type: { content_type: "image/jpeg" }


    #name
    validates :name,
        presence: { :message => "Informe o nome da empresa" },
        uniqueness: { :message => "Uma empresa já foi cadastrada com esse nome" }    

    validates_length_of :name,
        :allow_blank => false,
        :within => 2..85,
        :too_short => 'O nome da empresa deve ter no mínimo 2 caracteres',
        :too_long => 'O nome da empresa deve ter no máximo 85 caracteres'

    #email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email,
        :allow_blank => true,
        format: { with: VALID_EMAIL_REGEX, :message => 'Insira um e-mail válido' }

    #telephone
    validates :telephone,
        :allow_blank => true,
        numericality: { :message => "O telefone deve conter apenas números" }


    #address
    validates_length_of :address,
        :allow_blank => true,
        :within => 3..80,
        :too_short => 'O endereço deve ter no mínimo 3 caracters',
        :too_long => 'O endereço deve ter no máximo 80 caracters'

    #description
    validates_length_of :description,
        :allow_blank => true,
        :within => 0..500,
        :too_long => 'A descrição deve ter no máximo 500 caracters'

end
