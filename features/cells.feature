Feature: Cells support for Middleman

  Scenario: Render a basic cell
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "Hello."

  Scenario: Cells in non-default directory
    Given the Server is running at "non-default-dir-app"
    When I go to "/index.html"
    Then I should see "Hello from non-default directory."

  Scenario: Render with helpers
    Given the Server is running at "helpers-app"
    When I go to "/index.html"
    Then I should see "This is rendered by a helper."
    When I go to "/method.html"
    Then I should see "This is rendered by #foobar."
    When I go to "/collection.html"
    Then I should see "Item #1"
    Then I should see "Item #2"
    Then I should see "Item #3"

  Scenario: Edit and reload
    Given the Server is running at "reload-app"
    When I go to "/index.html"
    Then I should see "Before"
    And a file named "source/cells/reload/show.erb" with:
      """
      <p>After</p>
      """
    When I go to "/index.html"
    Then I should see "After"

  Scenario: View helpers
    Given the Server is running at "view-helpers-app"
    When I go to "/index.html"
    Then I should see:
      """
      <a href="https://twitter.com/notozeki">Follow me</a>
      """
    When I go to "/render_nested_cells.html"
    Then I should see:
      """
      <p>This is a parent.</p>
      <p>This is a child.</p>
      """
    When I go to "/app_shortcuts.html"
    Then I should see "Awesome Site"
    Then I should see "Middleman::Cells::Extension"

  Scenario: Hamlit support
    Given the Server is running at "hamlit-app"
    When I go to "/index.html"
    Then I should see "<p>This is a Hamlit.</p>"

  Scenario: Haml support
    Given the Server is running at "haml-app"
    When I go to "/index.html"
    Then I should see "<p>This is a Haml.</p>"

  Scenario: Slim support
    Given the Server is running at "slim-app"
    When I go to "/index.html"
    Then I should see "<p>This is a Slim.</p>"
