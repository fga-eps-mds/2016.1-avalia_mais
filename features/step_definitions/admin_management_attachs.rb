Given (/^I am on the log in page I will log in as admin$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'admin'
	fill_in 'session_password', :with=> '12345'
	click_button ("Entrar")
	expect(page).to have_content("Login realizado com sucesso")
end

And (/^I will get in management page$/) do
	find("#welcome-user").click
	click_link ("Área de gerenciamento")
end

And (/^I will see "Oi Fixo" attach request$/) do
	click_link('Oi Fixo')
end

And (/^I should be redirect to attach show page/) do
	expect(page).to have_content("Vínculo Solicitado")
end

And (/^I will press "Aprovar Vínculo" button$/) do
	 click_link ("Aprovar Vínculo")
end

Then (/^I should be redirect to company page and recive a message "Empresa vinculada com sucesso!"/) do
	expect(page).to have_content("Empresa vinculada com sucesso!")
end

#Scenario 2

And (/^I will see "Oi Celular" attach request$/) do
	click_link('Oi Celular')
end

And (/^I will press "Rejeitar Vínculo" button$/) do
	 click_link ("Rejeitar Vínculo")
end

Then (/^I should be redirect to company page and recive a message "Vínculo rejeitado com sucesso!"/) do
	expect(page).to have_content("Vínculo rejeitado com sucesso!")
end

