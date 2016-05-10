Feature: Create User
	In order to evaluate a company
	As a visitor
	Should create an account

	Scenario: Required fields of new user are not filled
		Given I am on the index
		And I will press on "Entrar" link
		And I will be redirect to login page
		And I will press "Cadastrar" button
		And I will be redirect to sign up page
		When I press on "Cadastrar"
		Then the user page is loaded with notice message "Email nao pode ser vazio"

	Scenario: Success in create an account
		Given I am on the index
		And I will press on "Entrar" link
		And I will be redirect to login page
		And I will press "Cadastrar" button
		And I will be redirect to sign up page
		And I will fill "Robot" in complete name
		And I will fill "robot" in nickname
		And I will fill "123456" in password
		And I will fill "123456" in confirm password
		And I will fill "robot@gmail.com" in email
		And I will fill "10-05-1990" in birthday
		And I will choose "Masculino" in gender
		When I press on "Cadastrar"
		Then the user page is loaded with notice message "Cadastro efetuado com sucesso!"

	Scenario: Account already exists
		Given I am on the index
		And I will press on "Entrar" link
		And I will be redirect to login page
		And I will press "Cadastrar" button
		And I will be redirect to sign up page
		And I will fill "Robot" in complete name
		And I will fill "robot" in nickname
		And I will fill "123456" in password
		And I will fill "123456" in confirm password
		And I will fill "robot@gmail.com" in email
		And I will fill "10-05-1990" in birthday
		And I will choose "Masculino" in gender
		When I press on "Cadastrar"
		Then the user page is loaded with notice message "has already been taken"


