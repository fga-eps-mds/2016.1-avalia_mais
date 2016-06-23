And (/^I will click on \"Editar\" link$/) do 
	click_link("Editar")
end

And (/^I click on \"Editar Comentário\" icon$/) do 
	find(".edit-Robot-1").click
end

And (/^I will fill \"Comentário teste editado\" in edit comment field$/) do 
	fill_in 'comment_new_description', :with => 'Comentário teste editado'
end

And (/^I will press \"Editar\" button$/) do 
	click_button ("Editar")
end

Then (/^my comment should be edited$/) do
	expect(page).to have_content("Comentário teste editado")
end