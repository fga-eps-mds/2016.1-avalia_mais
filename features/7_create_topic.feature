Feature: 

	Scenario: Success in create topic
		Given I am on the index
		Given I am logged in
		And I will search for "Azura"
		When I press "Azura" button
		Then I should be redirect to Azura page
		When I press "Fórum" button
		And I press "Novo Tópico" button
		Then I should be redirect to new topic page
		And I fill "Título do tópico" field with "Dúvida"
		And I fill "Conteúdo do tópico" field with "Eu tenho uma dúvida"
		When I press "Confirmar" button
		Then I should be redirect to show topic page