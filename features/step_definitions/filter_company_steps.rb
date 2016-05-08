#Scenario 1
And (/^I fill "Buscar" field with "Azura"$/) do
	fill_in 'Buscar', :with => 'Azura'
end

Then (/^The search page is loaded with company name "Azura Software"$/) do
	expect(page).to have_content("Azura Software")
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

Then (/^The page now have company name "Azura Software"$/) do
	expect(page).to have_content("Azura Software")
end

#Scenario 3
And (/^I fill "Buscar" field with "xwztr"$/) do
	fill_in 'Buscar', :with => 'xwztr'
end

Then (/^The search page is loaded with empty results$/) do
	expect(page).to have_content("Nenhuma Empresa encontrada com o termo \"xwztr\".
")
end