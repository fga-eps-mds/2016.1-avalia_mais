Feature: Delete User
	To delete user
	As a user 
	I will delete my account

	Scenario: User will login and delete his account
		Given I am already on the login page
		And I will log in as 'Jose'
		And I should be redirect to home page with a massage 'Login realizado com sucesso'
		And I will see my profile, pressing 'Perfil' 
		And I will press 'Excluir minha conta'
		And I will confirm pressing 'OK'
		Then I should be redirect to index page