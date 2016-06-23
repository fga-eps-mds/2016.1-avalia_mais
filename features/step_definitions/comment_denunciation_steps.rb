Given (/^I am logged on in topics of "OI Fixo" company page$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'robot'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
	fill_in 'Buscar', :with=> 'Oi Fixo'
	click_button ("Buscar")
	click_link('Oi Fixo')
	find("#js-btn-forum").click
end

And (/^I will press on "Denunciar comentário" icon$/) do
	find("#denounce-comment1").click
end

And (/^I will press on "Tirar denúncia do comentário" icon$/) do
	find("#destroy_denounce-comment1").click
end

And (/^I will see "Retirar Denuncia" in page$/) do 
	expect(page).to have_content("Retirar Denúncia")
end

Then (/^I should see "Denunciar" icon$/) do 
	#expect(page).to find("#denounce-comment1")
	expect(page).to have_css("#denounce-comment1")
end