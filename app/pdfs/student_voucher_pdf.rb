class StudentVoucherPdf < Prawn::Document
   def initialize(student)
# :page_size => :A4, :page_layout => :landscaped
       super()
       @student=student
       header
        text "Hello #{@student.name}"
   end
   
   def header
move_down -20    #This inserts an image in the pdf file and sets the size of the image
    image "#{Rails.root}/app/assets/images/lums.png", width: 30, height: 50
  end

    
    
end