Feature: Edit topic
	In order to edit a topic
	As a system's user
	Should edit a topic

	Scenario: User will edit a topic created by himself
		Given I am logged in and on a topic created by me
		And I click on "Editar"
		And I fill "Título do tópico" field with "Tópico editado"
		And I fill "Conteúdo do tópico" field with "Este tópico foi editado"
		And I will press "Confirmar" button
		Then I should be redirected to the edited topic

	Scenario: User will not see 'Editar'
		Given I am logged in on a topic created by other
		Then I should not see "Editar" button