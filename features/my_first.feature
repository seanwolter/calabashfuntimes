Feature:
    As a User I want to view a players
    minecraft details

    Scenario: App should display correct user name
        Given I am on the Player List
		When I view the details for player scottferg
        Then I should see the name scottferg

    Scenario: App should display correct x, y, z coordinates
        Given I am on the Player List
		When I view the details for player scottferg
        Then I should see the coordinates 999, 777, 555