# require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

# User did not logged in but search for a company, with id = 1
Given (/^I am at home page$/) do 
	visit 'http://localhost:3000'
end

Given (/^I am at login page$/) do 
	visit 'http://localhost:3000/login'
end

And (/^I will login as "Empresario"/) do 
	fill_in 'session_login', :with=> 'empresario'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
end

And (/^I fill in "Buscar" with "nike"$/) do
	fill_in 'Buscar', :with=> 'nike'
end

And (/^I press "Buscar" button/) do
	click_button ("Buscar")
end

And (/^I will click on 'Cadastrar Empresa'/) do
	click_link('Cadastrar Empresa')
end

And (/^I will register my company/) do 
	fill_in 'company_name', :with=> 'EmpresaSoftware'
	fill_in 'company_address', :with=> 'Rua do comercio, Loja 5'
	fill_in 'company_telephone', :with=> '6133001010'
	fill_in 'company_email', :with=> 'empresasoftware@email.com'
	fill_in 'tarea', :with=> 'Empresa que especializada em soluções de software.'
	click_button ("Confirmar")
end


When (/^I press "Nike" button/) do
	click_link('Nike')
end

Then (/^I should be redirect to my company page$/) do
	expect(page).to have_content('EmpresaSoftware')
end

Then (/^I should be redirect to Nike page$/) do
	expect(page).to have_content("Nike")
end

Then (/^the page should have a link named "Nike"/) do
	expect(page).to have_content("Nike")
end

