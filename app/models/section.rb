class Section < ActiveRecord::Base
    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
           csv << column_names
           all.each do |section|
               csv << section.attributes.values_at(*column_names)
           end
       end
    end
    
    validates :section_id, presence: true, length: { minimum: 1 }
    validates :instructor_id, presence: true, length: { minimum: 1 }
    validates :section_name, presence: true

end
