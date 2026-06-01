Feature: OrangeHRM Essential Functionalities
  As a QA Analyst
  I want to verify the core modules of OrangeHRM
  So that employees can use the system without critical bugs

  @login @smoke
  Scenario: Login with valid credentials
    Given the user is on the OrangeHRM login page
    When the user enters the username "Admin"
    And the user enters the password "admin123"
    And clicks on the Login button
    Then the user should be redirected to the Dashboard

  @login @negative
  Scenario: Login with invalid credentials
    Given the user is on the OrangeHRM login page
    When the user enters the username "Admin"
    And the user enters the password "wrong_password"
    And clicks on the Login button
    Then the system should display the error message "Invalid credentials"

  @pim @smoke
  Scenario: Add a new employee with valid data
    Given the user is logged in as an Administrator
    And navigates to the "Add Employee" page in the PIM module
    When the user fills in the "First Name" with "John"
    And fills in the "Last Name" with "Doe"
    And clicks the "Save" button
    Then the employee profile for "John Doe" should be created and displayed

  @leave @edge_case
  Scenario: Apply for leave in the past
    Given the user is logged in
    And navigates to the "Apply Leave" page
    When the user selects the leave type "Vacation"
    And sets the From and To dates to a date in the past
    And clicks the "Apply" button
    Then the system should prevent the submission and show a validation warning