class Instructor < ActiveRecord::Base
    has_secure_password
    def self.authenticate(user,pass)
        instructor = Instructor.find_by_username(user)
        if instructor.authenticate(pass)
            return instructor[:id]
        else 
            return false
        end
    end

    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
           csv << column_names
           all.each do |instructor|
               csv << instructor.attributes.values_at(*column_names)
           end
       end
    end

    validates :instructor_id, presence: true
    validates :instructor_name, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :subject_name, presence: true

end
