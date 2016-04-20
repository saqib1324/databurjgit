class Section < ActiveRecord::Base
    require 'roo'
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
        section = find_by_id(row["section_id"]) || new
        section.attributes = row.to_hash.slice(*row.to_hash.keys)
        section.save!
      end
    end
    
    def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end   
 
    validates :room_location, presence: true, length: { minimum: 1 }
    validates :section_name, presence: true

end
