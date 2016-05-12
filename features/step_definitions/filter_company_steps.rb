#Scenario 1
And (/^I fill "Buscar" field with "Oi Fixo"$/) do
	fill_in 'Buscar', :with => 'Oi Fixo'
end

Then (/^The search page is loaded with company name "Oi Fixo"$/) do
	expect(page).to have_content("Oi Fixo")
end


#Scenario 2
And (/^I click on "Categorias"$/) do
	click_link('Categorias')
end

And (/^The segments page is loaded with segments names$/) do
	expect(page).to have_content("Bancos de Dados e Cadastros de Consumidores")
end

And (/^I click on "Bancos de Dados e Cadastros de Consumidores"$/) do
	find(".segment-1").click
end

And (/^I press "Buscar" button$/) do
	click_button ("Buscar")
end

Then (/^The page now have company name "Boa Vista Serviços"$/) do
	expect(page).to have_content("Boa Vista Serviços")
end

#Scenario 3
And (/^I fill "Buscar" field with "invalid company"$/) do
	fill_in 'Buscar', :with => 'invalid company'
end

Then (/^The search page is loaded with empty results$/) do
	expect(page).to have_content("Nenhuma Empresa encontrada com o termo \"invalid company\".
")
end