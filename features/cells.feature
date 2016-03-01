Feature: Cells support for Middleman

  Scenario: Render a basic cell
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "Hello."
