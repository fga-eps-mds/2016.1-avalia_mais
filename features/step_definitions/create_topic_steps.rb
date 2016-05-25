When (/^I press "Fórum" button$/) do
	find("#forum").click
	click_link("Forúm")
end

And (/^I press "Novo Tópico" button$/) do
	click_link ("Novo tópico")
end

Then (/^I should be redirect to new topic page$/) do
	expect(page).to have_content("Aqui você pode criar seu novo tópico")
end

And (/^I fill "Título do tópico" field with "Dúvida"$/) do
	fill_in 'topic_title', :with => 'Dúvida'
end

And (/^I fill "Conteúdo do tópico" field with "Eu tenho uma dúvida"$/) do
	fill_in 'topic_body', :with => 'Eu tenho uma dúvida'
end

Then (/^I should be redirect to show topic page$/) do 
	expect(page).to have_content("Título: Dúvida")
end