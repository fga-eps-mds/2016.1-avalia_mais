And (/^I will press on "Entrar" link$/) do
	click_link("Entrar")
end

And (/^I will be redirect to login page$/) do
	expect(page).to have_content("Login")
end

And (/^I will press "Cadastrar" button$/) do
	click_link('Cadastrar')
end

And (/^I will be redirect to sign up page$/) do
	expect(page).to have_content("Cadastre um usuário")
end

And (/^I will fill "Robot" in complete name/) do
	fill_in 'user_name', :with => 'Robot'
end

And (/^I will fill "robot" in nickname$/) do
	fill_in 'user_login', :with => 'robot'
end

And (/^I will fill "123456" in password$/) do
	fill_in 'user_password', :with => '123456'
end

And (/^I will fill "123456" in confirm password$/) do
	fill_in 'user_password_confirmation', :with => '123456'
end

And (/^I will fill "robot@gmail.com" in email$/) do
	fill_in 'user_email', :with => 'robot@gmail.com'
end

And (/^I will fill "10-05-1990" in birthday$/) do
	fill_in 'user_dateBirthday', :with => '10-05-1990'
end

And (/^I will choose "Masculino" in gender$/) do
	choose('user_gender_m')
end


When (/^I press on "Cadastrar"$/) do
	click_button ("Cadastrar")
end

Then (/^the user page is loaded with notice message "Cadastro efetuado com sucesso!"$/) do
	expect(page).to have_content("Cadastro efetuado com sucesso!")
end


Then (/^the user page is loaded with notice message "has already been taken"$/) do
	expect(page).to have_content("has already been taken")
end


Then (/^the user page is loaded with notice message "Email nao pode ser vazio"$/) do
	expect(page).to have_content("Email nao pode ser vazio")
end

