Given (/^I am Company pag "oi fixo"$/) do
	fill_in 'Buscar', :with => 'Oi Fixo'
	click_button "Buscar"
	click_link ("Oi Fixo")
end

And (/^I click on "Editar empresa"$/) do
	click_button("Editar empresa")
end

And(/^I click on "show-name"$/) do
	find("#show-name").click
end

And (/^I fill "name" field with "Oi fixo Brasil"$/) do
	fill_in 'name', :with => "Oi Fixo Brasil"
end


Then (/^the show page should load with notice message "Atributo atualizado com sucesso"/) do
	expect(page).to have_content("Atributo atualizado com sucesso")
end

And(/^I click on "show-address"$/) do
	find("#show-address").click
end

And (/^I fill "address" field with "quadra 310 asa norte"$/) do
	fill_in 'address', :with => "qadra 310 asa norte"
end

And(/^I click on "show-email"$/) do
	find("#show-email").click
end

And (/^I fill "email" field with "oifixo@hotmail.com"$/) do
	fill_in 'email', :with => "oifixo@hotmail.com"
end


And(/^I click on "show-telephone"$/) do
	find("#show-telephone").click
end

And (/^I fill "telephone" field with "6135563212"$/) do
	fill_in 'telephone', :with => "6135563212"
end

And(/^I click on "show-description"$/) do
	find("#show-description").click
end

And (/^I fill "tarea" field with "empresa focada em telefone fixo"$/) do
	fill_in 'tarea', :with => "empresa focada em telefone fixo"
end







