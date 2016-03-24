Given(/^I should be at the Login page$/) do
    visit root_path
end
When (/^I fill in ".*?" with ".*?" $/) do |field,text|
    fill_in(field, with: text)
end

When(/^I click on "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Then(/^I should be on "([^"]*)"$/) do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end
Then(/^I should see "([^"]*)"$/) do |text|
  if page.respond_to? :should
  page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


####################################
Given(/^the following instructors exist:$/) do |instructors_table|
  instructors_table.hashes.each do |instructor|
      Instructor.create!(instructor)
  end
end

####################################
Given(/^the following sections exist:$/) do |sections_table|
  sections_table.hashes.each do |section|
      Section.create!(section)
  end
end

When(/^I follow "([^"]*)"$/) do |arg1|
  click_link(arg1)
end
