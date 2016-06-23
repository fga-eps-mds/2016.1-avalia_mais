Feature: Create Question
             To delete user
             As any kind of user
             Should search a company

   Scenario: Success in create Questions of company
        Given I am on the log in page I will log in
        And I fill "Buscar" field with "tim" and visit the page
        And I press "Enquete" button
        And I will press "Criar enquete" button
        And I will fill in question title with "Qual o melhor contato"
        And I press "plus"
        And I will fill "telefone" in question option attributes
        And I press "plus"
        And I will fill "email" in question option attributes
        When I press on "Criar"
        Then page should have content "Votar"

