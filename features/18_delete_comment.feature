Feature: Delete Comment
	In order to delete a existing comment
	As a system's logged user
	Should delete a existing comment into some topic page

	Scenario: User will create a new comment into some topic page
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will press "Fórum" button
		And I will click on "Tópico editado"
		And I will press "Excluir" link for the comment that I want to delete
		And I will confirm pressing 'OK'
		Then My comment should be deleted