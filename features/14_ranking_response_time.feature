Feature: Ranking by response time
	To see companies classification
	As a system user
	I would like to see ranking by response time

	Scenario: All companies
		Given I am in the welcome page
		And I move the cursor into "Ranking"
		When I click on "Tempo De Resposta"
		Then I should see a page with the text "1°"

	Scenario: By category
		Given I am in the welcome page
		And I move the cursor into "Ranking"
		And I click on "Tempo De Resposta"
		When I click on "Categoria"
		Then I should see a page with the text "Bancos de Dados e Cadastros de Consumidores"