Feature: Attach company to user
	In order to attach some company
	As admin
	Should get in management page

	Scenario: Success accept the attach
		Given I am on the log in page I will log in as admin
		And I will get in management page
		And I will see "Oi Fixo" attach request
		And I should be redirect to attach show page
		And I will press "Aprovar Vínculo" button
		Then I should be redirect to company page and recive a message "Empresa vinculada com sucesso!"

	Scenario: Success reject the attach
		Given I am on the log in page I will log in as admin
		And I will get in management page
		And I will see "Oi Celular" attach request
		And I should be redirect to attach show page
		And I will press "Rejeitar Vínculo" button
		Then I should be redirect to company page and recive a message "Vínculo rejeitado com sucesso!"