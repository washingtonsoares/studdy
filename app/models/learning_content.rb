class LearningContent < ApplicationRecord
  belongs_to :course
  has_many :watched_media
end
