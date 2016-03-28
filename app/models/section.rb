class Section < ActiveRecord::Base
    require "roo"
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
    
    def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        section = find_by_section_id(row["section_id"]) || new
        section.attributes = row.to_hash.slice(*row.to_hash.keys)
        section.save!
      end
    end
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end 
    
    
    validates :section_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :instructor_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :section_name, presence: true

end
