Feature: 
	In order to see all the denounced topics
	As admin
	Should visit the management page to see the denounced topics

	Scenario: List all denounced topics
		Given I am logged on a topic created by other and i denounce this topic
		And I will see all topics denounces in management page
		Then I should see "Tópico editado"