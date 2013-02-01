Feature:
    As a User I want to view a players
    minecraft details

    Scenario: App should display correct x, y, z coordinates
        Given I am on the Player List
        When I view the details for player scottferg
        Then I should be navigated to the Player Details screen
        And Should see the coordinates 123, 456, 789