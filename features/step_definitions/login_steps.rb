#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
Given (/^I am on the log in page$/) do
	visit 'http://localhost:3000/login'
end

And (/^I fill in "Apelido ou e-mail" with "robot"$/) do
	fill_in 'session_login', :with=> 'robot'
end

And (/^I fill in "Apelido ou e-mail" with "invalidbot"$/) do
	fill_in 'session_login', :with=> 'invalidbot'
end

And (/^I fill in "Senha" with "123456"$/) do
	fill_in 'session_password', :with=> '123456'
end

When (/^I press "Entrar" button/) do
	click_button ("Entrar")
end

Then (/^the initial page should load with notice message "Login realizado com sucesso"/) do
	expect(page).to have_content("Login realizado com sucesso")
end

Then (/^the login page should reload with notice message "Login ou senha inválidos"/) do
	expect(page).to have_content("Login ou senha inválidos")
end
