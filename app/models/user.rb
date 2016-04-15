class User < ActiveRecord::Base
	
	validates :name, presence: true, length: { minimum: 3, maximum: 50}
	validates :email, presence: true, length: { maximum: 50}, uniqueness: true
	validates :password, presence: true, length: { minimum: 4, maximum: 16}
	validates :dateBirthday, presence: true
	validates :gender, presence: true
	validates :login, presence: true, length: { minimum: 4, maximum: 50}, uniqueness: true

end

	