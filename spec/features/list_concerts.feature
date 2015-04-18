Feature: List concerts 
  When I add my last fm username 
  I want to be able to list concerts based on my top artists

  Scenario: Valid last fm username
    Given Last fm user "cored"
    When I view the list of concerts
    Then I want to be able to see "Huey Lewis And The News"
