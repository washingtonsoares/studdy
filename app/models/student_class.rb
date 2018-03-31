class StudentClass < ApplicationRecord
  belongs_to :course
  has_many :enrollments
  has_many :users, through: :enrollments
end
