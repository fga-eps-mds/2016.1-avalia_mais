And (/^I will click on \"Dúvida\" link$/) do
	click_link ("Dúvida")
end

And (/^I am redirected to topic page$/) do
	expect(page).to have_content("Dúvida")
end

And (/^I fill the comment field with \"Comentário teste\"$/) do
	fill_in 'Escreva um comentário...', :with => 'Comentário teste'
end

And (/^I will press \"Comentar\" button$/) do
	click_button ("Comentar")	
end

Then (/^My comment should be created$/) do 
	expect(page).to have_content("Comentário teste")
end