class Course < ApplicationRecord
  belongs_to :college
  has_many :student_classes
  has_many :learning_contents
end
