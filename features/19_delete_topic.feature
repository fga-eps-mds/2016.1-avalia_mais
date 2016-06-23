Feature: Delete topic
	In order to delete a topic
	As a system's user
	Should delete a topic

	Scenario: User will not see 'Excluir'
		Given I am on a topic created by other
		Then I should not see "Excluir" button

	Scenario: User will delete a topic created by himself
		Given I am logged in and on a topic created by me
		And I click on "Excluir"
		And I will confirm pressing 'OK'
		Then I should be redirected to the company page