Given(/^the following Students exist:$/) do |students_table|
    students_table.hashes.each do |student|
       Student.create!(student)
    end
end

Given(/^I should be at the the New Student page$/) do
    visit new_student_path
end

When(/^I go to "([^"]*)"$/) do |arg1|
  visit new_student_path
  save_and_open_page
end

When(/^I press "([^"]*)"$/) do |button|
    click_button(button)
end

