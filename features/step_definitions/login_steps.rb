Given(/^I should be at the Login page$/) do
  # Write code here that turns the phrase above into concrete actions
    visit "https://seproject-databurj.c9users.io/"
end

When (/^I fill in ".*?" with ".*?" $/) do |field,text|
    fill_in(field, with: text)
end

When(/^I click on "([^"]*)"$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
  click_button(arg1)
end

Then(/^I should be on "([^"]*)"$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
    path_to(arg1)
end



####################################
# Then(/^I should see the title "([^"]*)"$/) do |arg1|
#   # Write code here that turns the phrase above into concrete actions
#     expect(page).to have_title(title)
# end