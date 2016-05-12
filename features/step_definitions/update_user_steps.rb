
Given (/^I am logged in$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'robot'
	fill_in 'session_password', :with=> '123456'
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

And (/^I fill "name" field with "Handsome Robot"$/) do
	fill_in 'name', :with => "Handsome Robot"
end

When (/^I press "Atualizar" button/) do
	click_button ("Atualizar")
end

Then (/^the show page should load with notice message "Senha atualizada com sucesso"/) do
	expect(page).to have_content("Senha atualizada com sucesso")
end

Then (/^the show page should load with notice message "Perfil atualizado"/) do
	expect(page).to have_content("Perfil atualizado")
end



And(/^I click on "show-gender"$/) do
	find("#show-gender").click
end

And (/^I fill "Gênero" with "masculino"$/) do
	choose('masculino')
end


And(/^I click on "show-dateBirthday"$/) do
	find("#show-dateBirthday").click
end

And (/^I fill "dateBirthday" field with "20-10-1994"$/) do
	fill_in 'dateBirthday', :with => "20-10-1994"
end


And(/^I click on "show-pass"$/) do
	find("#show-pass").click
end

And (/^I fill "password-older" field with "123456"$/) do
	fill_in 'password-older', :with => '123456'
end

And (/^I fill "password-new" field with "newpass"$/) do
	fill_in 'password-new', :with => 'newpass'
end

And (/^I fill "password-confirme" field with "newpass"$/) do
	fill_in 'password-confirme', :with => 'newpass'
end

And (/^I fill "password-older" field with "1010"$/) do
	fill_in 'password-older', :with => '1010'
end

Then (/^the show page should load with notice message "Senha invalida!/) do
	expect(page).to have_content("Senha invalida!")
end
	






