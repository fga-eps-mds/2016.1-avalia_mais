Feature: Edit comment
	In order to edit a old comment
	As a system's logged user
	I will edit my comment in some topic page

	Scenario: User will edit his topic in Oi Fixo page
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will press "Fórum" button
		And I will click on "Dúvida" link
		And I am redirected to topic page
		And I click on "Editar Comentário" icon
		And I will fill "Comentário teste editado" in edit comment field
		And I will press "Editar" button
		Then my comment should be edited