Feature: Landmark Show Page
  feature tests of the landmark show page

  Scenario Outline: Shows add recording button (or not)
    Given a generic landmark
    Given I'm a <user_type>
    When I visit that landmark's show page
    Then I <should_or_should_not> see the Upload new recording button

    Examples:
    | user_type   | should_or_should_not |
    | visitor     | should not           |
