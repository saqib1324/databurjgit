Given(/^the following Students exist:$/) do |students_table|
  # table is a Cucumber::Core::Ast::DataTable
  # Write code here that turns the phrase above into concrete actions
    students_table.hashes.each do |student|
       Student.create!(student)
    end
end

# When(/^I follow "([^"]*)"$/) do |arg1|
#     # Write code here that turns the phrase above into concrete actions
#     click_on(arg1)
# end
Given (/^I am on the New Student page $/) do |page_name|
  visit "https://seproject-databurj.c9users.io/students/new"
end

When (/^I fill in ".*?" with ".*?" $/) do |field,text|
    # fill_in(field, with: text)
    element = page.find(field)
    element.set(text)
end

When(/^I press "([^"]*)"$/) do |button|
    # Write code here that turns the phrase above into concrete actions
    click_button(button)
end

Then(/^I should see "([^"]*)"$/) do |arg1|
# Write code here that turns the phrase above into concrete actions
    if page.respond_to? :should
        page.should have_content(text)
    else
        assert page.has_content?(text)
    end
end
# Then /^(?:|I )should see '([^"]*)'$/ do |text|
#   if page.respond_to? :should
#     page.should have_content(text)
#   else
#     assert page.has_content?(text)
#   end
# end