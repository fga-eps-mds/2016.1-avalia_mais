Feature: Update Company
	To use application resources
	As a system user
	I would like in  update my  registed data  

	Scenario: Update Company Name
		Given I am on the log in page I will log in
		Given I am Company pag "oi fixo"
		And I click on "Editar empresa"
		And I click on "show-name"
		And I fill "name" field with "Oi fixo Brasil"
		When I press "Atualizar" button
		Then the show page should load with notice message "Atributo atualizado com sucesso"

	Scenario: Update Company address
		Given I am on the log in page I will log in
		Given I am Company pag "oi fixo"
		And I click on "Editar empresa"
		And I click on "show-address"
		And I fill "address" field with "quadra 310 asa norte"
		When I press "Atualizar" button
		Then the show page should load with notice message "Atributo atualizado com sucesso"

	Scenario: Update Company email
		Given I am on the log in page I will log in
		Given I am Company pag "oi fixo"
		And I click on "Editar empresa"
		And I click on "show-email"
		And I fill "email" field with "oifixo@hotmail.com"
		When I press "Atualizar" button
		Then the show page should load with notice message "Atributo atualizado com sucesso"

	Scenario: Update Company Telefone
		Given I am on the log in page I will log in
		Given I am Company pag "oi fixo"
		And I click on "Editar empresa"
		And I click on "show-telephone"
		And I fill "telephone" field with "6135563212"
		When I press "Atualizar" button
		Then the show page should load with notice message "Atributo atualizado com sucesso"	

	Scenario: Update Company Description
		Given I am on the log in page I will log in
		Given I am Company pag "oi fixo"
		And I click on "Editar empresa"
		And I click on "show-description"
		And I fill "tarea" field with "empresa focada em telefone fixo"
		When I press "Atualizar" button
		Then the show page should load with notice message "Atributo atualizado com sucesso"