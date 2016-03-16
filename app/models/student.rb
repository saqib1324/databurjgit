class Student < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3 }
    validates :tracking_id, presence: true
    validates :SEX, length: { maximum: 1}
    validates :phone_number, numericality: { only_integer: true }
end
