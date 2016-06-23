Feature: Ranking by grade
	To see companies classification
	As a system user
	I would like to see ranking by grade

	Scenario: All companies
		Given I am in the welcome page
		And I move the cursor into "Ranking"
		When I click on "Nota"
		Then I should see a page with the text "1°"

	Scenario: By category
		Given I am in the welcome page
		And I move the cursor into "Ranking"
		And I click on "Nota"
		When I click on "Categoria"
		Then I should see a page with the text "Bancos de Dados e Cadastros de Consumidores"