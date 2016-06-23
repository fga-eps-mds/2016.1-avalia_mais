Given (/^I am in the welcome page$/) do
	visit 'http://localhost:3000'
end

And (/^I move the cursor into "Ranking"$/) do
	find("#ranking").click
end

When (/^I click on "Nota"/) do
	click_link ("Nota")
end

Then (/^I should see a page with the text "1°"/) do
	expect(page).to have_content("1°")
end

When (/^I click on "Categoria"/) do
	find("#grade-segment").click
end

Then (/^I should see a page with the text "Bancos de Dados e Cadastros de Consumidores"/) do
	sleep(5)
	expect(page).to have_content("Bancos de Dados e Cadastros de Consumidores")
end