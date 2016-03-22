class Instructor < ActiveRecord::Base
    validates :instructor_id, presence: true, numericality: { only_integer: true }
    validates :instructor_name, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :subject_name, presence: true

end
