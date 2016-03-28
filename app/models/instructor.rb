class Instructor < ActiveRecord::Base
    require "roo"
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
    
    def self.import(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        instructor = find_by_instructor_name(row["instructor_name"]) || new
        instructor.attributes = row.to_hash.slice(*row.to_hash.keys)
        instructor.save!
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
    
    

    validates :instructor_id, presence: true
    validates :instructor_name, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :subject_name, presence: true

end
