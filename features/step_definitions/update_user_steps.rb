# cenario 1 updade name
Given (/^I am on the login user$/) do
	visit 'http://localhost:3000/login'
end

And (/^I do my login user$/) do
	fill_in 'session_login', :with=> 'gesielsf'
	fill_in 'session_password', :with=> '1313'
	click_button ("Entrar")
	expect(page).to have_content("Login realizado com sucesso")
end

And (/^I click on "Perfil"$/) do
	find("#welcome-user").click
	click_link ("Perfil")
end

And(/^I click on "Editar-name"$/) do
	find("#show-name").click
end

And (/^I fill "name" field with "Camila"$/) do
	fill_in 'name', :with => "Camila"
end

When (/^I press "Atualizar" button/) do
	click_button ("Atualizar")
end

Then (/^the show page should load with notice message "Profile updated"/) do
	have_content("Profile updated")
end

#Scenario update gender

And(/^I click on "show-gender"$/) do
	find("#show-gender").click
end

And (/^I fill "masculino" with "masculino"$/) do
	choose('masculino')
end

#Scenario update dateBirthday

And(/^I click on "show-dateBirthday"$/) do
	find("#show-dateBirthday").click
end
And (/^I fill "dateBirthday" field with "20-10-1994"$/) do
	fill_in 'dateBirthday', :with => "20-10-1994"
end

#Scenario update password

And(/^I click on "show-pass"$/) do
	find("#show-pass").click
end

And (/^I fill "password-older" field with "1313"$/) do
	fill_in 'password-older', :with => "1313"
end

And (/^I fill "password-new" field with "0101"$/) do
	fill_in 'password-new', :with => "0101"
end

And (/^I fill "password-confirme" field with "0101"$/) do
	fill_in 'password-confirme', :with => "0101"
end

And (/^I fill "masculino" with "Masculino"$/) do
	choose('masculino')
end

And (/^I fill "password-older" field with "1010"$/) do
	fill_in 'password-older', :with => "1010"
end

Then (/^the show page should load with notice message "Senha invalida!/) do
	have_content("Senha invalida!")
end
	






