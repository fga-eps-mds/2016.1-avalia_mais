Feature: Update User
	To use application resources
	As a system user
	I would like in  update my  registed data  

	Scenario: Uptade username
		Given I am on the login user
		And I do my login user
		And I click on "Perfil"
		And I click on "EditarN"
		And I fill "name" field with "Camila"
		When I press "Atualizar" button
		Then the show page should load with notice message "Profile updated"

	Scenario: Uptade dateBirthday
		Given I am on the login user
		And I do my login user
		And I click on "Perfil"
		And I click on "EditarD"
		And I fill "dateBirthday" field with "20-10-1994"
		When I press "Atualizar" button
		Then the show page should load with notice message "Profile updated"

		Scenario: Uptade gender
		Given I am on the login user
		And I do my login user
		And I click on "Perfil"
		And I click on "EditarG"
		And I fill "masculino" with "Masculino"
		When I press "Atualizar" button
		Then the show page should load with notice message "Profile updated"

	Scenario: Uptade password
		Given I am on the login user
		And I do my login user
		And I click on "Perfil"
		And I click on "EditarS"
		And I fill "password-older" field with "1313"
		And I fill "password-new" field with "0101"
		And I fill "password-confirme" field with "0101"
		When I press "Atualizar" button
		Then the show page should load with notice message "Profile updated"

	Scenario: Uptade password error
		Given I am on the login user
		And I do my login user
		And I click on "Perfil"
		And I click on "EditarS"
		And I fill "password-older" field with "1010"
		And I fill "password-new" field with "0101"
		And I fill "password-confirme" field with "0101"
		When I press "Atualizar" button
		Then the show page should load with notice message "Senha invalida!"	