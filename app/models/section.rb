class Section < ActiveRecord::Base
    validates :section_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :instructor_id, presence: true, length: { minimum: 1 }, numericality: { only_integer: true}
    validates :section_name, presence: true

end
