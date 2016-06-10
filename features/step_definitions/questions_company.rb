#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
Given (/^I am on the log in page I will log in$/) do
    visit 'http://localhost:3000/login'
    fill_in 'session_login', :with=> 'robot'
    fill_in 'session_password', :with=> '123456'
    click_button ("Entrar")
    expect(page).to have_content("Login realizado com sucesso")
end

And (/^I will search for "Tim" and visit the page$/) do
    fill_in 'Buscar', :with=> 'Tim'
    click_button ("Buscar")
    click_link('Tim')
end

And (/^I will search for "Tim" and visit the page$/) do
    fill_in 'Buscar', :with=> 'Tim'
    click_button ("Buscar")
    click_link('Tim')
end

And (/^I press "Enquete" button/) do
    click_link('Enquete')
end

And (/^I press "Criar enquete" button/) do
    click_link('Criar enquete')
end

And (/^I fill "Pergunta" field with "Qual a melhor maneira de contato?"$/) do
    fill_in 'question[title]', :with => 'Qual a melhor maneira de contato?'
end

And (/^I press "plus" button/) do
    click_link('Adicionar Opção')
end

And (/^I fill "Opção" field with "telefone"$/) do
    fill_in 'question[option_attributes][1465525647031][title]', :with => 'telefone'
end

And (/^I press "plus" button/) do
    click_link('Adicionar Opção')
end

And (/^I fill "Opção" field with "email"$/) do
    fill_in 'question[option_attributes][1465525647031][title]', :with => 'email'
end

And (/^I press "Criar" button/) do
    click_link('Criar')
end