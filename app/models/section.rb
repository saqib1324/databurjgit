class Section < ActiveRecord::Base
    has_secure_password
    def self.authenticate(user,pass)
        section = Section.find_by_username(user)
        if section.authenticate(pass)
            return section[:id]
        else 
            return false
        end
    end
    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
           csv << column_names
           all.each do |section|
               csv << section.attributes.values_at(*column_names)
           end
       end
    end
    
    validates :section_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :instructor_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :section_name, presence: true

end
