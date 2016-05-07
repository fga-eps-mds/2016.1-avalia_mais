
Given (/^I am already on the login page$/) do
	visit 'http://localhost:3000/login'
end

And (/^I will log in as 'Jose'$/) do
	fill_in 'session_login', :with=> 'Jose'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
end

And (/^I should be redirect to home page with a massage 'Login realizado com sucesso'/) do
	expect(page).to have_content("Login realizado com sucesso")
end

And (/^I will see my profile, pressing 'Perfil'/) do
	click_link("Perfil")
end

And (/^I will press 'Excluir minha conta'/) do
	click_button("Excluir minha conta")
end

And (/^I will confirm pressing 'OK'$/) do
  page.driver.browser.switch_to.alert.accept    
end

#And (/^I will confirm pressing 'OK'/) do
#	click_on("OK")
#end

Then (/^I should be redirect to index page/) do
	expect(page).to have_content("Avalie sua empresa")
end
