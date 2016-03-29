class Student < ActiveRecord::Base
    
    has_secure_password
    def self.authenticate(user,pass)
        student = Student.find_by_username(user)
        if student.authenticate(pass)
            return student[:id]
        else 
            return false
        end
    end
    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
           csv << column_names
           all.each do |student|
               csv << student.attributes.values_at(*column_names)
           end
       end
    end
    
    validates :name, presence: true, length: { minimum: 3 }
    # validates :tracking_id, presence: true
    validates :SEX, length: { maximum: 1}
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 15 }   
end