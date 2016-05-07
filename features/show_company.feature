
Feature: Show company
	To see the informations about company
	As a vistor
	I will search for a company

	Scenario: User did not logged in
		Given I am at home page
		And I fill in "Buscar" with "nike"
		And I press "Buscar" button
		Then the page should have a link named "Nike"
		When I press "Nike" button
		Then I should be redirect to Nike page

	Scenario: User will login and create a new company
		Given I am at login page
		And I will login as "Empresario" 
		And I will click on 'Cadastrar Empresa'
		And I will register my company
		Then I should be redirect to my company page