class User < ActiveRecord::Base
	
	validates :name, presence: false, length: { minimum: 10, maximum: 50}
	validates :email, presence: false, length: { maximum: 50}
	validates :password, presence: false, length: { minimum: 8, maximum: 16}
	validates :dateBirthday, presence: false
	validates :gender, presence: false
	validates :login, presence: false, length: { minimum: 4, maximum: 50}

	validates_uniqueness_of :user_login
	validates_uniqueness_of :user_email

end
