Feature: Create Company
	In order to evaluate a company
	As a system's user
	Should create an company page

	Scenario: Success in create Company
		Given I am logged in
		And I click on "Cadastrar Empresa"
		And I am redirected to page "Cadastrar Empresa"
		And I fill "Nome da Empresa" field with "Azura Software"
		And I fill "Endereço da Empresa" field with "Rua das Pitangueiras Lote 10"
		And I fill "Telefone de Contato" with "84752121"
		And I fill "E-mail da Empresa" field with "azurasoftware@gmail.com"
		And I fill "Descricao" field with "Empresa de Software especialista em Desenvolvimento Web, IOS e Android"
		When I press "Confirmar" button
		Then the company page is loaded with notice message "Cadastro efetuado com sucesso!"

	Scenario: Create Company only with the required fields
		Given I am logged in
		And I click on "Cadastrar Empresa"
		And I am redirected to page "Cadastrar Empresa"
		And I fill "Nome da Empresa" field with "Obelisco"
		When I press "Confirmar" button
		Then the company page is loaded with notice message "Cadastro efetuado com sucesso!"

	Scenario: User not logged in
		Given I am on the index
		And I click on "Cadastrar Empresa" logged out
		Then the login page is loaded with notice message "Para cadastrar uma empresa é preciso estar logado"

	Scenario: Company's name already exists in the system
		Given I am logged in
		And I click on "Cadastrar Empresa"
		And I am redirected to page "Cadastrar Empresa"
		And I fill "Nome da Empresa" field with "Azura Software"
		When I press "Confirmar" button
		Then the new company page should reload with notice message "Uma empresa já foi cadastrada com esse nome"

	Scenario: Required fields are not filled
		Given I am logged in
		And I click on "Cadastrar Empresa"
		And I am redirected to page "Cadastrar Empresa"
		When I press "Confirmar" button
		Then the new company page should reload with notice message "Informe o nome da empresa"