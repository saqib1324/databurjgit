class Section < ActiveRecord::Base
    has_many :students
    def self.to_csv(options = {})
       CSV.generate(options) do |csv|
           csv << column_names
           all.each do |section|
               csv << section.attributes.values_at(*column_names)
           end
       end
    end
    
    validates :section_id, presence: true, length: { minimum: 1 }
    validates :room_location, presence: true, length: { minimum: 1 }
    validates :section, presence: true

end
