# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	User.create! :name => "admin", :login => "admin", :password => "12345",
		:password_confirmation => "12345", :email => "admin@email.com",
		:gender => "m", :admin => true, :active => true, :dateBirthday =>"10-01-1990",
		:uf_id => "1"
