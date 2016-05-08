Feature: Filter Company
	In order to see some company page 
	As any kind of user
	Should search a company

	Scenario: Success in search a company by name
		Given I am on the index
		And I fill "Buscar" field with "Azura"
		And I press "Buscar" button
		Then The search page is loaded with company name "Azura Software"
	

	Scenario: Success in filter a company by segment
		Given I am on the index
		And I click on "Categorias"
		And The segments page is loaded with segments names
		And I click on "Bancos de Dados e Cadastros de Consumidores"
		Then The page now have company name "Azura Software"	

	Scenario: Search don't return any result
		Given I am on the index
		And I fill "Buscar" field with "xwztr"
		And I press "Buscar" button
		Then The search page is loaded with empty results	
