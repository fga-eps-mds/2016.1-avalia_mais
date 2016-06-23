Given (/^I am logged in and on a topic created by me$/) do
	visit 'http://localhost:3000/login'
	fill_in 'session_login', :with=> 'robot'
	fill_in 'session_password', :with=> '123456'
	click_button ("Entrar")
	fill_in 'Buscar', :with=> 'Oi Fixo'
	click_button ("Buscar")
	click_link('Oi Fixo')
	find("#js-btn-forum").click
	click_link ("Dúvida")
end

Given (/^I am logged in on a topic created by other$/) do
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

And (/^I click on "Editar"$/) do
	click_link ("Editar")
end

And (/^I fill "Título do tópico" field with "Tópico editado"$/) do
	fill_in 'topic_title', :with => 'Tópico editado'
end

And (/^I fill "Conteúdo do tópico" field with "Este tópico foi editado"$/) do
	fill_in 'topic_body', :with => 'Este tópico foi editado'
end

Then (/^I should be redirected to the edited topic$/) do 
	expect(page).to have_content("Tópico editado")
end

Then (/^I should not see "Editar" button$/) do 
	expect(page).to_not have_content("Editar")
end

