#Scenario 1
And (/^I fill "Buscar" field with "Azura Software"$/) do
	fill_in 'company_search', :with => 'Azura Software'
end

And (/^I press "Buscar" button$/) do
	click_button ("Buscar")
end

And (/^The search page is loaded with message "Resultado da Busca"$/) do
	expect(page).to have_content("Resultado da Busca")
end

When (/^I click on "Azura Software"$/) do
	click_link ("Azura Software")
end

Then (/^I am redirected to company page with title "Azura Software"$/) do
	expect(page).to have_content("Azura Software")
	expect(page).to have_content("Bancos de Dados e Cadastros de Consumidores")
end


#Scenario 2
