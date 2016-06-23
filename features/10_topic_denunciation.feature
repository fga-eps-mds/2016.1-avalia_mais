Feature: Topic denunciation
	In order to denunciate a topic 
	As any kind of user
	Should denunciate topic or remove denunciation

	Scenario: User should denunciate a topic
	Given I am logged on a topic created by other
	And I click on "Denunciar" button
	And I will confirm pressing 'OK'
	And I should see "Retirar Denuncia"
	And I click on "Retirar Denuncia" button
	Then I should see "Denunciar"