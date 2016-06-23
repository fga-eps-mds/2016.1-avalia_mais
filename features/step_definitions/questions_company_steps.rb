#require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

And (/^I fill "Buscar" field with "tim" and visit the page$/) do
    fill_in 'Buscar', :with=> 'Tim'
    click_button ("Buscar")
    click_link('Tim')
    expect(page).to have_content("Tim")
end

And (/^I press "Enquete" button/) do
    find("#js-btn-enquete").click
end

And (/^I will press "Criar enquete" button$/) do
    click_button ("Criar enquete")
    expect(page).to have_content("Pergunta")
end

And (/^I will fill in question title with "Qual o melhor contato"$/) do
       fill_in 'question_t', :with => 'Qual o melhor contato?'
end

And (/^I will fill "telefone" in question option attributes$/) do
    fill_in 'opcoes', :with => 'telefone'
end

And (/^I press "plus"/) do
     find("#plus").click
end

And (/^I will fill "email" in question option attributes$/) do
    fill_in 'options', :with => 'email'
end

When (/^I press on "Criar"/) do
    click_button('Criar')
end

Then (/^page should have content "Votar"$/) do
    expect(page).to have_content("Votar")
end