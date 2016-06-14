Given (/^I am on a topic created by other$/) do
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

And (/^I click on "Excluir"$/) do
	click_link ("Excluir")
end

Then (/^I should not see "Excluir" button$/) do
	expect(page).to_not have_content("Excluir")
end

Then (/^I should be redirected to the company page$/) do 
	expect(page).to have_content('Fórum')
end