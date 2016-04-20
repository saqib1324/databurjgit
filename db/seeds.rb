# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#instructor.create(id: 1, instructor_name: 'Saeed Saigol', email: '17100283@lums.edu.pk', subject_name: 'punjabi')
# instructors_list = [{:instructor_id => 1, :instructor_name => 'Alvi', :email => "alvi@lums.edu.pk", :subject_name => "punjabi"},
#              {:instructor_id => 2, :instructor_name => 'bean', :email => "bean@lums.edu.pk", :subject_name => "sindhi"},
#             {:instructor_id => 3, :instructor_name => 'butt', :email => "butt@lums.edu.pk", :subject_name => "balochi"},
#              {:instructor_id => 4, :instructor_name => 'lol', :email => "lol@lums.edu.pk", :subject_name => "pushto"},
#         ]

# instructors_list.each do |instructor|
#  Instructor.create!(instructor)
# end
User.create!(:username => 'databurj', :password => 'windows787!')
Student.create!(:name => "Muhammad Sohail Aslam", :tracking_id => "2016-N-0012", :matric_percentage => "95.86", :monthly_income => "50000", :SEX => "M", :section => "A", :city => "Lahore", :father_name => "Aslam", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std1", :password => "std1")
Student.create!(:name => "Aliya Ali", :tracking_id => "2016-N-0783", :matric_percentage => "94.6", :monthly_income => "48000", :SEX => "F", :section => "B", :city => "Islamabad", :father_name => "Ali Hussain", :DOB => "21/04/1999",  :email => "aliya@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "Gulzar colony, Peshawar cantt", :username => "std2", :password => "std2")
Student.create!(:name => "Hafiz Muhammad junaid Raza", :tracking_id => "2016-N-0955", :matric_percentage => "93.86", :monthly_income => "44000", :SEX => "M", :section => "C", :city => "Lahore", :father_name => "Raza Ahmed Khan", :DOB => "13/08/1996",  :email => "junaid@lol.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-855/C, Gulzar House Lahore cantt", :username => "std3", :password => "std3")
Student.create!(:name => "Muhammad Saud Bukhari", :tracking_id => "2016-N-0234", :matric_percentage => "92.846", :monthly_income => "42000", :SEX => "M", :section => "D", :city => "Karachi", :father_name => "Junaid Bukhari", :DOB => "23/08/1994",  :email => "bukhari@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "Layari central Colony Karachi cantt", :username => "std4", :password => "std4")
Student.create!(:name => "Sadia Pervez", :tracking_id => "2016-N-0567", :matric_percentage => "89.86", :monthly_income => "38000", :SEX => "F", :section => "E", :city => "Gujranwala", :father_name => "Allah dita", :DOB => "16/08/1998",  :email => "sadia@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. 12/A gujrawnwala cantt", :username => "std5", :password => "std5")
Student.create!(:name => "Muhammad Asghar", :tracking_id => "2016-N-0612", :matric_percentage => "95.816", :monthly_income => "40000", :SEX => "M", :section => "F", :city => "Lahore", :father_name => "Haq Ilahi", :DOB => "06/08/1999",  :email => "asghar@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std6", :password => "std6")
Student.create!(:name => "Aimen Abdullah khan", :tracking_id => "2016-N-4012", :matric_percentage => "91.816", :monthly_income => "38000", :SEX => "F", :section => "G", :city => "Islamabad", :father_name => "Abdullah Khan", :DOB => "14/03/2000",  :email => "aimen@hotmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std6", :password => "std6")
Student.create!(:name => "Hashim Haider", :tracking_id => "2016-N-5012", :matric_percentage => "91.486", :monthly_income => "36000", :SEX => "M", :section => "G", :city => "Sanghar", :father_name => "Haider ahmed", :DOB => "26/08/1996",  :email => "haider@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std7", :password => "std7")
Student.create!(:name => "Junaid Haroon Siddiqui", :tracking_id => "2016-N-3452", :matric_percentage => "90.86", :monthly_income => "34000", :SEX => "M", :section => "H", :city => "Mianwali", :father_name => "Haroon Askari", :DOB => "24/02/1999",  :email => "junaid@lums.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std8", :password => "std8")
Student.create!(:name => "Shazia Saleem rana", :tracking_id => "2016-N-7012", :matric_percentage => "85.346", :monthly_income => "67000", :SEX => "F", :section => "I", :city => "Lahore", :father_name => "Muqsit saleem", :DOB => "26/08/1994",  :email => "ranag@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std9", :password => "std9")
Student.create!(:name => "Muhammad Affan Ahmed", :tracking_id => "2016-N-4512", :matric_percentage => "88.86", :monthly_income => "28000", :SEX => "M", :section => "J", :city => "Sakhar", :father_name => "Askari khan", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std10", :password => "std10")
Student.create!(:name => "Hadiqa khan", :tracking_id => "2016-N-5012", :matric_percentage => "95.186", :monthly_income => "40000", :SEX => "F", :section => "K", :city => "Bahawalpur", :father_name => "Khan haq", :DOB => "26/08/1994",  :email => "sohail@gmail.com", :phone_number => "0300-1253567", :secondary_phone_number => "042-37153453", :mailing_address => "H. No. E-850/C, Nishat Colony Lahore cantt", :username => "std11", :password => "std11")
Section.create!(:section_name => "A", :room_location => "A-14")