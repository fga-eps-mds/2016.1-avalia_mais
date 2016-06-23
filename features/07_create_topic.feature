Feature: Create Topic
	In order to create a new topic
	As a system's user
	Should create a new topic

	Scenario: User will create a new topic at Oi Fixo page
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will press "Fórum" button
		And I will press "Novo Tópico" button
		And I fill "Título do tópico" field with "Dúvida"
		And I fill "Conteúdo do tópico" field with "Eu tenho uma dúvida"
		And I will press "Confirmar" button
		Then I should be redirect to show topic page