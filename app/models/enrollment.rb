class Enrollment < ApplicationRecord
  belongs_to :user
  belongs_to :student_class
end
