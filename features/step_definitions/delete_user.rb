# Delete user steps

Given (/^I am already on the login page I will log in$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'stranger'
	fill_in 'session_password', :with=> 'stranger'
	click_button ("Entrar")
	expect(page).to have_content("Login realizado com sucesso")
end

And (/^I will see my profile, pressing 'Perfil'/) do
	find("#welcome-user").click
	click_link("Perfil")
end

And (/^I will press 'Excluir minha conta'/) do
	click_button("Excluir minha conta")
end

And (/^I will confirm pressing 'OK'$/) do
  page.driver.browser.switch_to.alert.accept    
end

Then (/^I should be redirect to index page/) do
	expect(page).to have_content("Avalie sua empresa")
end
