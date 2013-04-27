
Given(/^I am on the homepage$/) do
  visit root_path
end

When(/^I follow "(.*?)"$/) do |arg1|
	visit sign_up_path	
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I attach a file "(.*?)"$/) do |arg1|
  attach_file(File, "fixtures/abc.docx")
end

When(/^I press "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

