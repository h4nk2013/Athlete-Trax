Given(/^I am on home page$/) do
  visit root_path
  page.should have_selector('title', :text => 'Athlete-Trax | Home')
end

When(/^User has an account$/) do
  @user = User.create(email: "hrishi5@yahoo.com", password: "123456789", password_confirmation: "123456789", docu: File.open('features/abc.docx', 'rb'))
end

When(/^the user submits valid signin information$/) do
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button arg1
end

Then(/^I should see "(.*?)"$/) do |arg1|
  page.should have_content arg1
end

When(/^I follow Sign up$/) do
  visit sign_up_path
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, with: arg2
end

When(/^I attach a file "(.*?)"$/) do |arg1|
  attach_file('File', Rails.root.join('features', 'abc.docx'))
end

When(/^I follow Sign in$/) do
  visit log_in_path
  page.should have_selector('title', :text => 'Athlete-Trax | Sign in')
end

When(/^the user submits invalid signin information$/) do
  fill_in "Email", with: ""
  fill_in "Password", with: ""
end

When(/^I attach a invalid file "(.*?)"$/) do |arg1|
  attach_file('File', Rails.root.join('features', 'abc.txt'))
end

When(/^I already have same email in database$/) do
  @user = User.create(email: "sardar@yahoo.com", password: "123456789", password_confirmation: "123456789", docu: File.open('features/abc.docx', 'rb'))
end

Given(/^should have link to "(.*?)"$/) do |arg1|
  page.should have_selector("a", :href => arg1)
end

Given(/^I should see heading "(.*?)"$/) do |arg1|
  page.should have_selector('h1', :text => arg1)
end

Given (/^I follow About us$/) do
  visit about_path
  page.should have_selector('title', :text => 'Athlete-Trax | About Us')
  page.should have_selector('h1', :text => 'About Us')
end

Given(/^I follow Contact$/) do
  visit contact_path
  page.should have_selector('title', :text => 'Athlete-Trax | Contact')
  page.should have_selector('h1', :text => 'Contact')
end

