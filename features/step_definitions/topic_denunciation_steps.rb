Given (/^I am logged on a topic created by other$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'stranger'
	fill_in 'session_password', :with=> 'stranger'
	click_button ("Entrar")
	fill_in 'Buscar', :with=> 'Oi Fixo'
	click_button ("Buscar")
	click_link('Oi Fixo')
	find("#js-btn-forum").click
	click_link ("Tópico editado")
end

And (/^I click on "Denunciar" button$/) do
	find("#button-denunciation1").click
end

And (/^I click on "Retirar Denuncia" button$/) do
	find("#button-denunciation2").click
end

Then (/^I should see "Retirar Denuncia"$/) do 
	expect(page).to have_content("Retirar Denúncia")
end

Then (/^I should see "Denunciar"$/) do 
	expect(page).to have_content("Denunciar")
end

