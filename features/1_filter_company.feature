Feature: Filter Company
	In order to see some company page 
	As any kind of user
	Should search a company

	Scenario: Success in search a company by name
		Given I am on the index
		And I fill "Buscar" field with "Oi Fixo"
		And I press "Buscar" button
		Then The search page is loaded with company name "Oi Fixo"
	

	Scenario: Success in filter a company by segment
		Given I am on the index
		And I click on "Categorias"
		And The segments page is loaded with segments names
		And I click on "Bancos de Dados e Cadastros de Consumidores"
		Then The page now have company name "Boa Vista Serviços"	

	Scenario: Search don't return any result
		Given I am on the index
		And I fill "Buscar" field with "invalid company"
		And I press "Buscar" button
		Then The search page is loaded with empty results	
