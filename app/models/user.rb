class User < ActiveRecord::Base
	
	#name
	validates_length_of :name,
  		:within => 3..50,
  		:too_short => 'Nome tem que ter no minimo 3 caracters',
  		:too_long => 'Nome tem que ter no maximo 50 caracters'

	#email
	validates :email, :presence => { :message => 'Email nao pode ser vazio' }, length: { maximum: 50}, uniqueness: true

	#password
	validates_length_of :password,
  		:within => 4..16,
  		:too_short => 'Senha tem que ter com no minimo 4 caracters',
  		:too_long => 'Senha tem que tercom no maximo 16 caracters'

  	#gender
	validates :gender, :presence => { :message => 'Escolha seu genero' }

	#login
	validates_length_of :login,
  		:within => 4..50,
  		:too_short => 'Apelido com no minimo 3 caracters',
  		:too_long => 'Apelido com no maximo 50 caracters'

end

	