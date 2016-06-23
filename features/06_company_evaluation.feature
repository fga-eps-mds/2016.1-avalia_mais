	Feature: Company evaluation
	To evaluate a company
	As a user
	I will log in, visit a company page and send my avaluation

	Scenario: User will evaluate the company Oi Fixo 
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will fill "3" stars in personal evaluation
		Then the page should give me a message "Avaliação realizada com sucesso!"

	Scenario: User will send response time of Oi Fixo
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will choose "Sim" in response time of clains
		And I will fill "2" in response time
		And I will press on submit button
		Then the page should give me a message "Sua avaliação por tempo de resposta foi realizada com sucesso!"

	Scenario: User will send response time of Oi Fixo
		Given I am on the log in page I will log in
		And I will search for "Oi Fixo" and visit the page
		And I will choose "Sim" in response time of clains
		And I will fill "-2" in response time
		And I will press on submit button