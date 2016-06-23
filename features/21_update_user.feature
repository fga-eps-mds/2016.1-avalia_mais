Feature: Update User
	To use application resources
	As a system user
	I would like in  update my  registed data  

	Scenario: Update username
		Given I am logged in
		And I click on "Perfil"
		And I click on "Editar-name"
		And I fill "name" field with "Handsome Robot"
		When I press "Atualizar" button
		Then the show page should load with notice message "Perfil atualizado"

	Scenario: Update dateBirthday
		Given I am logged in
		And I click on "Perfil"
		And I click on "show-dateBirthday"
		And I fill "dateBirthday" field with "20-10-1994"
		When I press "Atualizar" button
		Then the show page should load with notice message "Perfil atualizado"

	Scenario: Update gender
		Given I am logged in
		And I click on "Perfil"
		And I click on "show-gender"
		And I fill "Gênero" with "masculino"
		When I press "Atualizar" button
		Then the show page should load with notice message "Perfil atualizado"

	Scenario: Update password error
		Given I am logged in
		And I click on "Perfil"
		And I click on "show-pass"
		And I fill "password-older" field with "1010"
		And I fill "password-new" field with "newpass"
		And I fill "password-confirme" field with "newpass"
		When I press "Atualizar" button
		Then the show page should load with notice message "Senha invalida!"	

	Scenario: Update password
		Given I am logged in
		And I click on "Perfil"
		And I click on "show-pass"
		And I fill "password-older" field with "123456"
		And I fill "password-new" field with "newpass"
		And I fill "password-confirme" field with "newpass"
		When I press "Atualizar" button
		Then the show page should load with notice message "Senha atualizada com sucesso"