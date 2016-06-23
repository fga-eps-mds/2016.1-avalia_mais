Feature: Request Attach
	In order to request a attach
	As a system's user
	Should request a new attach

	Scenario: User will request a new attach for Oi Fixo company
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will press "Solicitar Vínculo" button
		And I should be redirect to new attach request
		And I fill "CNPJ" field with "00000111110000"
		And I fill "Endereço" field with "Rua do comercio, bloco K, loja 10"
		And I will create Attach for Oi celular
		Then I should be redirect to company page with a notice "Solicitação feita com sucesso!"