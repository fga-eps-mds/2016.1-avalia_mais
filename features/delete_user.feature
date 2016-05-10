Feature: Delete User
	To delete user
	As a user 
	I will delete my account

	Scenario: User will login and delete his account
		Given I am already on the login page I will log in
		And I will see my profile, pressing 'Perfil' 
		And I will press 'Excluir minha conta'
		And I will confirm pressing 'OK'
		Then I should be redirect to index page