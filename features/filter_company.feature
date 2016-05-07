Feature: Filter Company
	In order to see some company page 
	As any kind of user
	Should search a company

	Scenario: Success in search a company by name
	Given I am on the index
	And I fill "Buscar" field with "Azura Software"
	And I press "Buscar" button
	And The search page is loaded with message "Resultado da Busca"
	When I click on "Azura Software"
	Then I am redirected to company page with title "Azura Software"
	

	# Scenario: Success in filter a company by segment
	# Given I am on the index
	# And I click on "Categorias"
	# And I click on "Buscar"
	# And The search page is loaded with message "Resultado da Busca"
	# When I click on "Azura Software"
	# Then I am redirected to company page with title "Azura Software"	