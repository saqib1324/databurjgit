# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#instructor.create(id: 1, instructor_name: 'Saeed Saigol', email: '17100283@lums.edu.pk', subject_name: 'punjabi')
instructors_list = [{:id => 1, :instructor_name => 'Alvi', :email => "alvi@lums.edu.pk", :subject_name => "punjabi"},
              {:id => 2, :instructor_name => 'bean', :email => "bean@lums.edu.pk", :subject_name => "sindhi"},
              {:id => 3, :instructor_name => 'butt', :email => "butt@lums.edu.pk", :subject_name => "balochi"},
              {:id => 4, :instructor_name => 'lol', :email => "lol@lums.edu.pk", :subject_name => "pushto"},
          ]

instructors_list.each do |instructor|
  Instructors.create!(instructor)
end
