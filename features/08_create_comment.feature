Feature: Create Comment
	In order to create a new comment
	As a system's logged user
	Should create a new comment into some topic page

	Scenario: User will create a new comment into some topic page
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will press "Fórum" button
		And I will click on "Dúvida" link
		And I am redirected to topic page
		And I fill the comment field with "Comentário teste"
		And I will press "Comentar" button
		Then My comment should be created