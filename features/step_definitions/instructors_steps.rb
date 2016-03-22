Given(/^the following instructors exist:$/) do |instructors_table|
  # table is a Cucumber::Core::Ast::DataTable
  # Write code here that turns the phrase above into concrete actions
  instructors_table.hashes.each do |instructor|
      Instructor.create!(instructor)
  end
end


When(/^I follow "([^"]*)"$/) do |arg1|
  # pending # Write code here that turns the phrase above into concrete actions
  click_link(arg1)
end

# When(/^I press "([^"]*)"$/) do |arg1|
#   pending # Write code here that turns the phrase above into concrete actions
# end