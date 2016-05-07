#Scenario 1

And (/ˆI click on "Entrar"$/) do
	click_link ("Entrar")
end

And (/ˆI am redirected to Login page"$/) do
	visit 'http://localhot:3000/login'
end

And (/ˆI click on "Cadastrar"$/) do
	click_link ("Cadastrar")
end

And (/ˆI am redirected to page "Cadastrar Usuario"$/) do
	visit 'http://localhot:3000/users/new'
end

And (/ˆI fill "Nome completo" field with "Usuário Teste"$/) do
	fill_in 'user_name', :with => 'Usuário Teste'
end

And (/ˆI fill "Apelido" field with "teste"$/) do
	fill_in 'user_login', :with => 'teste'
end

And (/ˆI fill "Senha" field with "123456"$/) do
	fill_in 'user_password', :with => '123456'
end

And (/ˆI fill "Confirme a senha" field with "123456"$/) do
	fill_in 'user_password_confirmation', :with => '123456'
end

And (/ˆfill "E-mail" field with "teste@teste.com"$/) do
	fill_in 'user_email', :with => 'teste@teste.com'
end

And (/ˆI fill "dd-mm-aaaa" field with "01-01-1991"$/) do
	fill_in 'user_dateBirthday', :with => '123456'
end

And (/ˆI fill "Genero" with "Masculino"$/) do
	choose('user_gender_m')
end

When (/^I press "Cadastrar" button$/) do
	click_button ("Cadastrar")
end

Then (/^the user page is loaded with notice message "Cadastro efetuado com sucesso!"$/) do
	expect(page).to have_content("Cadastro efetuado com sucesso!")
end

#Scenario 2

Then (/^the user page is loaded with notice message "has already been taken"$/) do
	expect(page).to have_content("has already been taken")
end

#Scenario 3

Then (/^the user page is loaded with notice message "Email nao pode ser vazio"$/) do
	expect(page).to have_content("Email nao pode ser vazio")
end

