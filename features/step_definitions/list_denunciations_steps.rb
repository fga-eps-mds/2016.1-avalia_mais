# Scenario 1

Given (/^I am logged on a topic created by other and i denounce this topic$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'admin'
	fill_in 'session_password', :with=> '12345'
	click_button ("Entrar")
	fill_in 'Buscar', :with=> 'Oi Fixo'
	click_button ("Buscar")
	click_link('Oi Fixo')
	find("#js-btn-forum").click
	click_link ("Tópico editado")
	find("#button-denunciation1").click
	page.driver.browser.switch_to.alert.accept
end

And (/^I will see all topics denounces in management page/) do
	click_link ("Inicio")
	find("#welcome-user").click
	click_link ("Área de gerenciamento")
	find("#grade-segment").click
end

Then (/^I should see "Tópico editado"$/) do 
	expect(page).to have_content("Tópico editado")
end