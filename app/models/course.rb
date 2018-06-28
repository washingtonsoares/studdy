class Course < ApplicationRecord
  belongs_to :college
  has_many :enrollments
  has_many :users, through: :enrollments
  has_many :learning_contents
  has_many :watched_media
end
