And (/^I click on "Cadastrar Empresa"$/) do
	find("#welcome-user").click
	click_link ("Cadastrar Empresa")
end

And (/^I click on "Cadastrar Empresa" logged out$/) do
	click_link ("Cadastrar Empresa")
end

And (/^I am redirected to page "Cadastrar Empresa"$/) do
	expect(page).to have_content("Cadastre sua Empresa")
end

And (/^I fill "Nome da Empresa" field with "Azura Software"$/) do
	fill_in 'company_name', :with=> 'Azura Software'
end

# And (/^I fill "Segmento da Empresa" field with "Banco de Dados e Cadastros de Consumidores"$/) do
# 	select "Banco de Dados e Cadastros de Consumidores", :from => "company_segment_id"
# end

And (/^I fill "Endereço da Empresa" field with "Rua das Pitangueiras Lote 10"$/) do
	fill_in 'company_address', :with=> 'Rua das Pitangueiras Lote 10'
end

# And (/^I fill "Uf da Empresa" field with "DF"$/) do
# 	select "DF", :from => "company_uf_id"
# end

And (/^I fill "Telefone de Contato" with "84752121"$/) do
	fill_in 'company_telephone', :with=> '84752121'
end

And (/^I fill "E-mail da Empresa" field with "azurasoftware@gmail.com"$/) do
	fill_in 'company_email', :with=> 'azurasoftware@hotmail.com'
end

And (/^I fill "Descricao" field with "Empresa de Software especialista em Desenvolvimento Web, IOS e Android"$/) do
	fill_in 'tarea', :with=> 'Empresa de Software especialista em Desenvolvimento Web, IOS e Android'
end

When (/^I press "Confirmar" button$/) do
	click_button ("Confirmar")
end

Then (/^the company page is loaded with notice message "Cadastro efetuado com sucesso!"$/) do
	expect(page).to have_content("Cadastro efetuado com sucesso!")
end

#Scenario 2

And (/^I fill "Nome da Empresa" field with "Obelisco"$/) do
	fill_in 'company_name', :with=> 'Obelisco'
end

#Scenario 3

Given (/^I am on the index$/) do
	visit 'http://localhost:3000'
end

Then (/^the login page is loaded with notice message "Para cadastrar uma empresa é preciso estar logado"$/) do
	expect(page).to have_content("Para cadastrar uma empresa é preciso estar logado")
end

#Scenario 4

Then (/^the new company page should reload with notice message "Uma empresa já foi cadastrada com esse nome"$/) do
	expect(page).to have_content("Uma empresa já foi cadastrada com esse nome")
end

#Scenario 5

Then (/^the new company page should reload with notice message "Informe o nome da empresa"$/) do
	expect(page).to have_content("Informe o nome da empresa")
end



