Feature: Create User
	In order to evaluate a company
	As a visitor
	Should create an account

	Scenario: Succes in create an account
		Given I am on the index
		And I click on "Entrar"
		And I am redirected to Login page
		And I click on "Cadastrar"
		And I am redirected to page "Cadastrar Usuario"
		And I fill "Nome completo" field with "Usuário Teste"
		And I fill "Apelido" field with "teste"
		And I fill "Senha" field with "123456"
		And I fill "Confirme a senha" field with "123456"
		And I fill "Confirme a senha" field with "123456"
		And I fill "E-mail" field with "teste@teste.com"
		And I fill "Genero" with "Masculino"
		When I press "Cadastrar" button
		Then the user page is loaded with notice message "Cadastro efetuado com sucesso!"

	Scenario: Account already exists
		Given I am on the index
		And I click on "Entrar"
		And I am redirected to Login page
		And I click on "Cadastrar"
		And I am redirected to page "Cadastrar Usuario"
		And I fill "Nome completo" field with "Usuário Teste"
		And I fill "Apelido" field with "teste"
		And I fill "Senha" field with "123456"
		And I fill "Confirme a senha" field with "123456"
		And I fill "Confirme a senha" field with "123456"
		And I fill "E-mail" field with "teste@teste.com"
		And I fill "Genero" with "Masculino"
		When I press "Cadastrar" button
		Then the user page is loaded with notice message "has already been taken"

	Scenario: Required fields of new user are not filled
		Given I am on the index
		And I click on "Entrar"
		And I am redirected to Login page
		And I click on "Cadastrar"
		And I am redirected to page "Cadastrar Usuario"
		When I press "Cadastrar" button
		Then the user page is loaded with notice message "Email nao pode ser vazio"




