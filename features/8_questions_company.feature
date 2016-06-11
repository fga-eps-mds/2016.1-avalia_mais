Feature: Create Question
             To delete user
             As any kind of user
             Should search a company

   Scenario: Success in create Questions of company
        Given I am logged in
        And I fill "Buscar" field with "tim"
        And I press "Buscar" button
        Then I should be redirect to Tim page
        And I press "Enquete"
        And I press "Criar enquete"
        And I will fill "Qual a melhor maneira de contato?" in question title
        And I press "plus"
        And I will fill "telefone" in question option attributes
        And I press "plus"
        And I will fill "email" in question option attributes
        When I press on "Criar"
