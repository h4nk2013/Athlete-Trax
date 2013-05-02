Feature: Testing Athlete-Trax

Scenario: Sign in Unsuccessful
	Given I am on home page
	When I follow Sign in
	And the user submits invalid signin information
	And I press "Log in"
	Then I should see "Invalid email or password"

Scenario: Sign in Successful
	Given I am on home page
	When I follow Sign in
	And User has an account
	And the user submits valid signin information
	And I press "Log in"
	And should have link to "Log out"
	And should have link to "submitted form"

Scenario: Signing up Unsuccessful
	Given I am on home page
	When I follow Sign up
	And I fill in "Email" with "sardar@yahoo.com"
	And I fill in "Password" with "123456789"
	And I fill in "Password confirmation" with "123456789"
	And I attach a invalid file "features/abc.txt"
	And I press "Sign up"
	Then I should see "content type is invalid"

Scenario: Email already exist
	Given I am on home page
	When I follow Sign up
	And I already have same email in database
	And I fill in "Email" with "sardar@yahoo.com"
	And I fill in "Password" with "123456789"
	And I fill in "Password confirmation" with "123456789"
	And I attach a file "features/abc.docx"
	And I press "Sign up"
	Then I should see "Email has already been taken"

Scenario: Signing up successful
	Given I am on home page
	When I follow Sign up
	And I fill in "Email" with "sardar@yahoo.com"
	And I fill in "Password" with "123456789"
	And I fill in "Password confirmation" with "123456789"
	And I attach a file "features/abc.docx"
	And I press "Sign up"
	Then I should see "Signed up!"

Scenario: Page contents
	Given I am on home page
	And I should see heading "Welcome to Athlete-Trax"
	And I should see heading "Sign Up"
	And I should see "by Hrishikesh Sardar"
	And should have link to "root_path"
	And should have link to "log_in_path"
	And should have link to "about_path"
	And should have link to "contact_path"

Scenario: Page Titles
	Given I am on home page
	And I follow Sign in
	And I follow About us
	And I follow Contact
