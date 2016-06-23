Given (/^I am logged on a topic created by other$/) do
	visit 'http://localhost:3000/login'
	click_link('Cadastrar')
	fill_in 'user_name', :with => 'Stranger'
	fill_in 'user_login', :with => 'stranger'
	fill_in 'user_password', :with => 'stranger'
	fill_in 'user_password_confirmation', :with => 'stranger'
	fill_in 'user_email', :with => 'stranger@gmail.com'
	fill_in 'user_dateBirthday', :with => '10-05-1990'
	choose('user_gender_m')
	click_button ("Cadastrar")
	fill_in 'Buscar', :with=> 'Oi Fixo'
	click_button ("Buscar")
	click_link('Oi Fixo')
	find("#js-btn-forum").click
	click_link ("Dúvida")
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

And (/^I should see "Denunciar"$/) do 
	expect(page).to have_content("Denunciar")
end