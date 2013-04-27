Feature: Signing up
In order to be attributed for my work
As a user
I want to be able to sign up

Scenario: Signing Up
	Given I am on the homepage
	When I follow "Sign up"
	And I fill in "Email" with "sardar@yahoo.com"
	And I fill in "Password" with "123456789"
	And I fill in "Password confirmation" with "123456789"
	And I attach a file "fixtures/abc.docx"
	And I press "Create User"
	Then I should see "Signed up!"