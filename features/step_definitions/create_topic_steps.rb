

And (/^I will press "Fórum" button$/) do
	find("#js-btn-forum").click
end

And (/^I will press "Novo Tópico" button$/) do
	click_link ("Novo tópico")
end

And (/^I fill "Título do tópico" field with "Dúvida"$/) do
	fill_in 'topic_title', :with => 'Dúvida'
end

And (/^I fill "Conteúdo do tópico" field with "Eu tenho uma dúvida"$/) do
	fill_in 'topic_body', :with => 'Eu tenho uma dúvida'
end

And (/^I will press "Confirmar" button$/) do
	find("#btn-Confirmar").click
end

Then (/^I should be redirect to show topic page$/) do 
	expect(page).to have_content("Dúvida")
end