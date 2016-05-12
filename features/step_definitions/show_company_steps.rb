# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# User did not logged in but search for a company and then another scenario doing login
Given (/^I am at home page$/) do 
	visit 'http://localhost:3000'
end

Given (/^I am at login page I will log in$/) do 
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'robot'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
end

And (/^I will search for "Azura"$/) do
	fill_in 'Buscar', :with=> 'Azura'
	click_button ("Buscar")
end

And (/^I will register my company/) do 
	find("#welcome-user").click
	click_link('Cadastrar Empresa')
	fill_in 'company_name', :with=> 'EmpresaSoftware'
	fill_in 'company_address', :with=> 'Rua do comercio, Loja 5'
	fill_in 'company_telephone', :with=> '6133001010'
	fill_in 'company_email', :with=> 'empresasoftware@email.com'
	fill_in 'tarea', :with=> 'Empresa que especializada em soluções de software.'
	click_button ("Confirmar")
end

When (/^I press "Azura" button/) do
	click_link('Azura')
end

Then (/^I should be redirect to my company page$/) do
	expect(page).to have_content('EmpresaSoftware')
end

Then (/^I should be redirect to Azura page$/) do
	expect(page).to have_content("Azura")
end

Then (/^the page should have a link named "Azura"/) do
	expect(page).to have_content("Azura")
end

