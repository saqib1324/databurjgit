class Student < ActiveRecord::Base
    require 'roo'
    # validates :section, :presence => true
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
    def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        student = find_by_id(row["tracking_id"]) || new
        student.attributes = row.to_hash.slice(*row.to_hash.keys)
        student.save!
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
    validates :name, presence: true, length: { minimum: 3 }
    # validates :tracking_id, presence: true
    validates :SEX, length: { maximum: 1}
    validates :phone_number, length: { maximum: 15 }   
end